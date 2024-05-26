// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Lesson3{
    uint public Value = 10;

    function Addition(uint Value2) public view returns(uint){
        return Value + Value2;
    } 

    function UserInputAddition(uint Value1, uint Value2) public pure returns(uint){
        return Value1 + Value2;
    }
}