// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Lesson4 {
            uint CurrentSavings;
            uint public Savings;   

            mapping (address => uint ) private balances;

            function Deposit (uint wallet) public {
                    Savings += wallet;
                    CurrentSavings = balances[msg.sender] += wallet;
                }

            function Withdraw(uint wallet) public{
                    if(balances[msg.sender] >= wallet){
                        Savings -= wallet;
                        balances[msg.sender] -= wallet;
                        }
                }
}
