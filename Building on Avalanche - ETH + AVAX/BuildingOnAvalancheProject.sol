// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Assessment is ERC20 {
    
    address public OwnerAddress;

    string[] AvailableDegenItem = ["Gold", "Silver", "Bronze"];
    uint[] AvailableDegenItemStock = [10000, 30000, 50000];
    uint[] DegenItemPrice = [1000, 500, 250];

    constructor() ERC20("Degen", "DGN") payable {
        OwnerAddress = msg.sender;
    }

    mapping (address WalletAddress => uint DGN) public DEGENBalance;
    mapping(address WalletAddress => mapping(string StoredItemName => uint256 StoredItemAmount)) public DEGENItemBag;

    function AvailableItems() public view returns (string[] memory Item, uint[] memory Stock, uint[] memory Price) {
        return (AvailableDegenItem, AvailableDegenItemStock, DegenItemPrice);
    }

    function DEGENRedeem(address Wallet, string memory DGNitem, uint DGNvalue) public payable{
        if(keccak256(abi.encodePacked(AvailableDegenItem[0])) == keccak256(abi.encodePacked(DGNitem))){

            uint total = 1000 * DGNvalue; 

            require(DEGENBalance[Wallet] >= total, "You dont have enough Degen");
            require(DGNvalue != 0, "You can't redeem a 0 value!");

            require(AvailableDegenItemStock[0] >= total, "Not enough gold available, restock soon.");

            DEGENBalance[Wallet] -= total;
            AvailableDegenItemStock[0] -= DGNvalue;
            DEGENItemBag[Wallet][DGNitem] += DGNvalue;

        }else if(keccak256(abi.encodePacked(AvailableDegenItem[1])) == keccak256(abi.encodePacked(DGNitem))){
            
            uint total = 500 * DGNvalue;

            require(DEGENBalance[Wallet] >= total, "You dont have enough Degen");
            require(DGNvalue != 0, "You can't redeem a 0 value!");


            require(AvailableDegenItemStock[1] >= total, "Not enough silver available, restock soon.");

            DEGENBalance[Wallet] -= total;
            AvailableDegenItemStock[1] -= DGNvalue;
            DEGENItemBag[Wallet][DGNitem] += DGNvalue;

        }else if(keccak256(abi.encodePacked(AvailableDegenItem[2])) == keccak256(abi.encodePacked(DGNitem))){
            
            uint total = 250 * DGNvalue;

            require(DEGENBalance[Wallet] >= total, "You dont have enough Degen");
            require(DGNvalue != 0, "You can't redeem a 0 value!");


            require(AvailableDegenItemStock[2] >= total, "Not enough bronze available, restock soon.");

            DEGENBalance[Wallet] -= total;
            AvailableDegenItemStock[2] -= DGNvalue;
            DEGENItemBag[Wallet][DGNitem] += DGNvalue;

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
