"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require("@angular/core");
var EventsListComponent = (function () {
    function EventsListComponent() {
        this.event = {
            id: 1,
            name: 'Angular Connect',
            date: '9/26/2036',
            time: '10:00 am',
            price: 599.99,
            imageUrl: '/app/assets/images/angularconnect-shield.png',
            location: {
                address: '1057 DT',
                city: 'London',
                country: 'England'
            }
        };
    }
    return EventsListComponent;
}());
EventsListComponent = __decorate([
    core_1.Component({
        selector: 'events-list',
        template: "\n  <div>\n    <h1>Upcoming Angular 2 Events</h1>\n    <hr/> \n    <div class='well hoverwell thumbnail'>\n    <h2>{{event.name}}</h2>\n    <div>Date: {{event.date}}</div>\n    <div>Time: {{event.time}}</div>\n    <div>Price ${{event.price}}</div>\n    <div>\n        <span>Location: {{event.location.address}}</span>\n        <span>&nbsp;</span>\n        <span>{{event.location.city}},{{event.location.country}}</span>\n    </div>\n    </div>\n  </div>\n  "
    }),
    __metadata("design:paramtypes", [])
], EventsListComponent);
exports.EventsListComponent = EventsListComponent;
//# sourceMappingURL=events-list-component.js.map