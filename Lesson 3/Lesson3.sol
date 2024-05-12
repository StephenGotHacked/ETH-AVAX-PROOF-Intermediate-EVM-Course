//SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Lesson3{
   mapping (address => uint) public Balances;

    event deposit(address indexed receiver, uint amount);
    event withdraw(address indexed owner, uint amount);
    event transfer(address indexed owner, address indexed receiver, uint amount );

   function Deposit(address _receiver, uint _amount) external payable {
        require( _receiver != address(0) , "unable to transfer, account is not registered");
        Balances[_receiver] += _amount;
        emit deposit( _receiver, _amount);
   }

   function Withdraw(address _owner, uint _amount)external payable {          
        if((Balances[_owner]<0) && (Balances[_owner]<= _amount )){
                revert("insufficient balance");
            }
        Balances[_owner] -= _amount;
        emit withdraw( _owner,  _amount);
   }

   function Transfer(address _owner, address _receiver , uint _ammount)external payable {
        require( _receiver != address(0), "unable to transfer, account is not registered");
        require(Balances[_owner] > _ammount, "insufficient balance"); 
        Balances[_receiver] += _ammount;
        Balances[_owner] -=  _ammount;
        emit transfer( _owner, _receiver, _ammount);
   }

    function getBalance(address _owner)external view returns (uint){
        return Balances[_owner];
    }
}
