// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface Interface {
    function setValue(uint256 _value) external;
    function getValue() external view returns (uint256);
}

abstract contract Abstract is Interface {
    uint256 internal value;

    function setValue(uint256 _value) public virtual override;

    function getValue() public view virtual override returns (uint256) {
        return value;
    }
}

contract Lesson2 is Abstract {
    function setValue(uint256 _value) public override {
        value = _value;
    }
}
