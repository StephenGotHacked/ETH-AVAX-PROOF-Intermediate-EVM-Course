//SPDX-License-Identifier: MIT
  pragma solidity ^0.8.18;
        
        contract Metacrafters{

            address public MainOwner;

            constructor(address Owner){
                MainOwner = Owner;
            }
                    mapping (address Address => uint Etherium)public Balances;

                function Minting (address Sender, uint _Etherium)public{
                        if(Sender == MainOwner){
                            Balances[Sender] += _Etherium;
                        }else{
                            revert("Only owner can mint an Etherium");
                        }
                }

                function Burning (address Sender, uint _Etherium)public{
                       if(Balances[Sender] <= _Etherium){
                            revert("You don't have enough balances");
                       }else{
                            Balances[Sender] -= _Etherium;
                       }
                }

                function Transferring(address From, address To, uint _Etherium)public{
                        if(Balances[From] <= _Etherium){
                            revert("You don't have enough balances");
                       }else{
                            Balances[From] -= _Etherium;
                            Balances[To] += _Etherium;
                       }
                }
         }
