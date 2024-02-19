// SPDX-License-Identifier: UNLICENSED;
pragma Solidity ^0.5.0

contract EventContarct{

    struct events{
        address Organizer;
        string name;
        uint date;
        uint prize;
        uint ticketCount;
        uint ticketRemaining;
    }

    mapping(uint=>events) public oEvents;
    mapping(address=>mapping(uint=>uint)) public tickets;
    uint public nextId;

    function createEvent(string memeory name,uint datae,uint prize,uint ticketCount) external{
        require(date>block.timestamp,"you organize event for event");
        require(ticketCount>0,"you can only orgsnize event only if you create more than 0 tickets");
        oEvents[mextId]=events(msg.sender,name,dtae,price,ticketCount,ticketCount);
        nextId++;
    }

    function BuyTicket(uint id,uint quantity) external payable{
        require(oEvents[id].date!=0,"event doesn't exists");
        require(block.timestamp<oEvents[id],date,"event has been completed");

        events storage _event=oEvents[id];
        require(msg.value==(_event.price*quantity,"ether is not enough"));
        require(_event,ticketRemaining>=quantity,"not enough ticket");

        _event.ticketRemaining-=quantity;
        tickets[msg.sender][id]+=quantity;
    }

    function transferTicket(uint id,uint quantity,address to) external payable{
        require(oEvents[id].date!=0,"doesn't exists");
        require(oEvents[id].date>block.timestamp,"account doesn't exists");
        require(tickets[msg.sender][id]-=quantity,"not enough tickets");

        tickets[msg.sender][id]-=quantity;
        tickets[to][id]+=quantity;
    }

}