//SPDX-License-Identifier: MIT
  pragma solidity ^0.8.25;
        
contract TypesOfFcuntion{
    
    address public OwnerAddress;

    constructor() payable{
        OwnerAddress = msg.sender;
    }

        mapping (address Address => uint SLP) AxieAccountBalance;
        event ErrorHandling(address Address, uint SLP);

    function SmoothLovePotionMint (address Address, uint SLPMinted)public{
            require(Address == OwnerAddress, "Limited Access for Owner only");

            AxieAccountBalance[Address] += SLPMinted;

            emit ErrorHandling(Address, SLPMinted);
        }

    function SmoothLovePotionBurn (address Address, uint SLPBurned)public{
            require(AxieAccountBalance[Address] >= SLPBurned, "Not enough Stored SLP");

            AxieAccountBalance[Address] -= SLPBurned;

            emit ErrorHandling(Address, SLPBurned);
        }

    function SmoothLovePotionTransfer (address Sender, address Receiver, uint SLPTransfer)public{
            require(AxieAccountBalance[Sender] >= SLPTransfer, "Not enough Stored SLP");
            
            AxieAccountBalance[Sender] -= SLPTransfer;
            AxieAccountBalance[Receiver] += SLPTransfer;

            emit ErrorHandling(Sender, SLPTransfer);
            emit ErrorHandling(Receiver, SLPTransfer);
        }
}
