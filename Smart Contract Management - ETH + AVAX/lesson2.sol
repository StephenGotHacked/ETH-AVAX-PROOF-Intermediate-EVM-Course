// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// NOTE: Deploy this contract first
contract Twocalled {
    // NOTE: storage layout must be the same as contract oneCall
    uint public Grade;
    address public UID;
    uint public value;


    function myFunction(uint256 _Grade, address _UID) public payable{
        Grade = _Grade;
        UID = _UID;
        value = msg.value;
    }
}

contract OneCall {
    uint public Grade;
    address public UID;
    uint public value;

    function callMyFunction(address _contractAddress, uint256 _Grade, address _UID) public payable{
        bytes memory data = abi.encodeWithSignature("myFunction(uint256,address)", _Grade, _UID);
        (bool success, ) = _contractAddress.call{value: msg.value}(data);
        require(success, "Low-level call failed");
    }
}
