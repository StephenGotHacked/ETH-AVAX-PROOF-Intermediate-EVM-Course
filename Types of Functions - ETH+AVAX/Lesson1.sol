// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lesson1 {
    
    address payable public Owner;

    constructor() payable {
        Owner = payable(msg.sender);
    }

    mapping(address Address=> uint Ether ) public CheckAcc;

    function EtherAccount(address Sender, uint _Ether) public payable{
        if(Sender != Owner){
            revert("You are not the owner");
        }else{
            CheckAcc[Sender] += _Ether;
        }
    }

    event Received(address Owner);

    fallback() external {
        (bool success,) = address(Owner).call(abi.encodeWithSignature("setter()"));
        require(success);
        emit Received(msg.sender);
    }
}
