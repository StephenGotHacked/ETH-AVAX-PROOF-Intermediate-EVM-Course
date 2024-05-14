// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Lesson1 {

    struct AboutMe{
        string FirstName;
        string LastName;
        uint Age;
    }

    AboutMe[] _AboutMe;

    function PushInArray(string calldata _FirstName, string calldata _LastName, uint _Age) external{
        _AboutMe.push(AboutMe(_FirstName, _LastName, _Age));
    }

    function EnterIndex(uint index) external view returns(string memory, string memory, uint){
        AboutMe memory AM = _AboutMe[index];
        return (AM.FirstName, AM.LastName, AM.Age);
    }
}
