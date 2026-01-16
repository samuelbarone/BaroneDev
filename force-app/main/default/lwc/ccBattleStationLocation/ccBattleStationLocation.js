import { LightningElement, wire, track } from 'lwc';
import { registerListener, unregisterAllListeners } from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';
import { CONSTANTS } from 'c/ccConstants';

export default class CcBattleStationLocation extends LightningElement {

    @wire(CurrentPageReference) pageRef;

    @track name;

    connectedCallback() {
        // subscribe to inputChangeEvent event
        registerListener(CONSTANTS.BATTLE_STATION_EVENT_STREAM, this.handleChange, this);
    }
    disconnectedCallback() {
        // unsubscribe from inputChangeEvent event
        unregisterAllListeners(this);
    }
    handleChange(event) {
       this.name = event;
    }

}