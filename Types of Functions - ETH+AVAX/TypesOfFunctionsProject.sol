//SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
        
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TypesOfFcuntion is ERC20{
       
    address public OwnerAddress;

    constructor() ERC20("Coindino", "COD") payable {
        OwnerAddress = msg.sender;
    }

    mapping (address account => uint amount) public CODBalance;

    function CoindinoMint(address account, uint CODAmount) public {
        require(msg.sender == OwnerAddress, "Limited Access for Owner only");

        _mint(account, CODAmount);
        CODBalance[account] += CODAmount;
    }

    function CoindinoBurn(address account, uint CODAmount) public {
        require(CODBalance[account] >= CODAmount, "Not enough Stored Coindino(COD)");

        _burn(account, CODAmount);
        CODBalance[account] -= CODAmount;
    }

    function CoindinoTransfer(address sender, address recipient, uint CODAmount) public {
        require(CODBalance[sender] >= CODAmount, "Not enough Stored Coindino(COD)");
        _approve(sender, recipient, CODAmount);
        _transfer(sender, recipient, CODAmount);

        CODBalance[sender] -= CODAmount;
        CODBalance[recipient] += CODAmount;
    }
}
