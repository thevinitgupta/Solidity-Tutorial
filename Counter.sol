// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    //code goes here...
    uint public count=0;

    function incrementCount() public {
        count = count + 1;
    }
}
