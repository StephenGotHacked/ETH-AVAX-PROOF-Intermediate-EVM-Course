// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
AGENDA!
Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
*/

contract Assessment is ERC20 {
    
    address public OwnerAddress;

    string[] AvailableDegenItem = ["Gold", "Silver", "Bronze"];
    uint[] AvailableDegenItemStock = [10000, 30000, 50000];
    uint[] DegenItemPrice = [1000, 500, 250];

    constructor() ERC20("Degen", "DGN") payable {
        OwnerAddress = msg.sender;
    }

    mapping (address WalletAddress => uint DGN) public DEGENBalance;

    function AvailableItems() public view returns (string[] memory Item, uint[] memory Stock, uint[] memory Price) {
        return (AvailableDegenItem, AvailableDegenItemStock, DegenItemPrice);
    }

    function DEGENRedeem(address Wallet, uint Budget, string memory DGNitem, uint DGNvalue) public payable{
        if(keccak256(abi.encodePacked(AvailableDegenItem[0])) == keccak256(abi.encodePacked(DGNitem))){
            
            require(DEGENBalance[Wallet] >= Budget, "You dont have enough Degen");
            require(DGNvalue != 0, "You can't redeem a 0 value!");

            uint total = 1000 * DGNvalue;

            require(AvailableDegenItemStock[0] >= total, "Not enough gold available, restock soon.");

            DEGENBalance[Wallet] -= total;
            AvailableDegenItemStock[0] -= DGNvalue;

        }else if(keccak256(abi.encodePacked(AvailableDegenItem[1])) == keccak256(abi.encodePacked(DGNitem))){
            
            require(DEGENBalance[Wallet] >= Budget, "You dont have enough Degen");
            require(DGNvalue != 0, "You can't redeem a 0 value!");

            uint total = 500 * DGNvalue;

            require(AvailableDegenItemStock[1] >= total, "Not enough silver available, restock soon.");

            Budget -= total;
            AvailableDegenItemStock[1] -= DGNvalue;

        }else if(keccak256(abi.encodePacked(AvailableDegenItem[2])) == keccak256(abi.encodePacked(DGNitem))){
            
            require(DEGENBalance[Wallet] >= Budget, "You dont have enough Degen");
            require(DGNvalue != 0, "You can't redeem a 0 value!");

            uint total = 250 * DGNvalue;

            require(AvailableDegenItemStock[2] >= total, "Not enough bronze available, restock soon.");

            DEGENBalance[Wallet] -= total;
            AvailableDegenItemStock[2] -= DGNvalue;

        }else{
            revert("Item not found, check your capitalization/spell!");
        }
    }

    function DEGENMint(address wallet, uint DGN) public {
        require(msg.sender == OwnerAddress, "Limited Access for Owner only");

        _mint(wallet, DGN);
        DEGENBalance[wallet] += DGN;
    }

    function DEGENBurn(address wallet, uint DGN) public {
        require(DEGENBalance[wallet] >= DGN, "Not enough Stored Degen(DGN)");

        _burn(wallet, DGN);
        DEGENBalance[wallet] -= DGN;
    }

    function DEGENTransfer(address sender, address recipient, uint DGN) public {
        require(DEGENBalance[sender] >= DGN, "Not enough Stored Degen(DGN)");

        _transfer(sender, recipient, DGN);

        DEGENBalance[sender] -= DGN;
        DEGENBalance[recipient] += DGN;
    }
}
