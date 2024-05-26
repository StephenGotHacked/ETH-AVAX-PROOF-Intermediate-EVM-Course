// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Lesson2 {
    uint value = 5;


    function getValue() public view returns(uint) {
        return value;
    }


    function addition(uint _x, uint _y) public pure returns(uint) {
        return _x + _y;
    }


    function deposit() public payable {
        value += msg.value;
    }
}

contract DerivedContract is Lesson2 {
    function DerivedgetValue() public view returns(uint) {
        return getValue();
    }

    function derivedaddition(uint _x, uint _y) public pure returns(uint) {
        return addition(_x, _y);
    }

    function deriveddeposit() public payable {
        super.deposit();
    }
}