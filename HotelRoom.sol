// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract HotelRoom{
    enum Status {
        Vacant, 
        Occupied
    }

    address payable public owner;
    Status public currentStatus;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = Status.Vacant;
    }

    event Occupy(address _occupant, uint _value);

    modifier onlyWhileVacant(){
        require(currentStatus == Status.Vacant, "Room Already Booked");
        _;
    }

    modifier costs(uint _amount){
        require(msg.value >= _amount, "Not Enough Ether");
        _;
    }

    function book() payable public onlyWhileVacant costs(2 ether){

        currentStatus = Status.Occupied;

        (bool sent, bytes memory data) = owner.call{value : msg.value}("");
        require(true);

        emit Occupy(msg.sender, msg.value);
    }
}
