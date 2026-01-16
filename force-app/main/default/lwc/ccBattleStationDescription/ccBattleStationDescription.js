import { LightningElement, api, track, wire } from 'lwc';
import { subscribe, onError } from 'lightning/empApi';
import { CONSTANTS } from 'c/ccConstants';

import { fireEvent } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';

import { getRecord, updateRecord, getFieldValue } from 'lightning/uiRecordApi';
import { refreshApex } from '@salesforce/apex';

import BATTLE_STATION_ID_FIELD from '@salesforce/schema/Battle_Station__c.Id';
import BATTLE_STATION_NAME_FIELD from '@salesforce/schema/Battle_Station__c.Name';

export default class CcBattleStationDescription extends LightningElement {

    @api recordId;
     
    wiredBattleStationCase;
 
    @track battleStation;
    @track disabled = true;


    @wire(CurrentPageReference) pageRef;


    @wire(getRecord, {
        recordId: '$recordId',
        fields: [BATTLE_STATION_NAME_FIELD]
    })
    myCaseRecord(res) {
        this.wiredBattleStationCase = res; 
        window.console.log(JSON.parse(JSON.stringify(res)));
        if (res.error) {
            // this.error = checkError(res.error);
            // this.error = 'Unknown error';
        } else if (res.data) {
            this.battleStation = res.data; 
        }
    }

    get battleStationName(){
        return getFieldValue(this.battleStation, BATTLE_STATION_NAME_FIELD);
    } 
 
    constructor() {
        super();
        // Invoke subscribe method of empApi. Pass reference to messageCallback
        this.subscribeToPlatformEvent();
    }

    subscribeToPlatformEvent() {
        subscribe(CONSTANTS.BATTLE_STATION_PLATFORM_EVENT, -1, this.battleStationUpdatedMessageCallback)
            .then( response => {
                
            })
            .catch(this.handlePlatformEventError);
 
        onError(this.handlePlatformEventError);
    }


    battleStationUpdatedMessageCallback = (response) => {
        refreshApex(this.wiredBattleStationCase).then(response => {
            fireEvent(this.pageRef, CONSTANTS.BATTLE_STATION_EVENT_STREAM,  this.battleStationName );   
        }); 
    } 

    // handlePlatformEventCallback = (response) => { 
    // }

    handlePlatformEventError = (event) => {}



    handleChange(event) {
        // Display field-level errors and disable button if a name field is empty.
       if (!event.target.value) {
        //    event.target.reportValidity();
           this.disabled = true;
       }
       else {
           this.disabled = false;
           this.battleStation = event.target.value;
       }
   }


   updateName() { 


    const fields = {};
    fields[BATTLE_STATION_ID_FIELD.fieldApiName] = this.recordId;
    fields[BATTLE_STATION_NAME_FIELD.fieldApiName] = this.battleStation;
    //fields[LASTNAME_FIELD.fieldApiName] = this.template.querySelector("[data-field='LastName']").value;

    const recordInput = { fields };

    updateRecord(recordInput);
        // .then(() => {
        //     // this.dispatchEvent(
        //     //     new ShowToastEvent({
        //     //         title: 'Success',
        //     //         message: 'Contact updated',
        //     //         variant: 'success'
        //     //     })
        //     // );
        //     // Display fresh data in the form
        //    // return refreshApex(this.contact);
        //    window.console.log('passed');
        // })
        // .catch(error => {
        //     // this.dispatchEvent(
        //     //     new ShowToastEvent({
        //     //         title: 'Error creating record',
        //     //         message: error.body.message,
        //     //         variant: 'error'
        //     //     })
        //     // );
        //     window.console.log(error);
        // });
     
   }
 
}