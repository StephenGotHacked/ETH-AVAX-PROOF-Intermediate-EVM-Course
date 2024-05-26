// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract ErrorHandling {
    function Require(uint UserInput) public pure {
        require(UserInput > 5, "Input must be greater than 5");
    }

    function Revert(uint UserInput) public pure {
        if (UserInput <= 5) {
            revert("Input must be greater than 5");
        }
    }

    uint public num = 1;

    function Assert() public view {
        assert(num == 0);
    }

    error InsufficientBalance(uint CurrentBalance, uint DeductedAmount);

    function CustomizeError(uint Amount) public view {
        uint bal = address(this).balance;
        if (bal < Amount) {
            revert InsufficientBalance({CurrentBalance: bal, DeductedAmount: Amount});
        }
    }
}