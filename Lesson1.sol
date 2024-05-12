// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Lesson1{

        address public admin;

        constructor(){
            admin = msg.sender;
        }

        modifier onlyowner{
            require(admin == msg.sender, "Limited access for Owner only");
            _;
        }

}
