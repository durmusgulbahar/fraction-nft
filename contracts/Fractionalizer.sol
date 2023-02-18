// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./Shares.sol";
contract Fractionalizer{

   uint immutable _sharesCount = 100;

    Shares _shares;
    constructor(){}

    struct Item{ 
        address owner;
        string name;
        string symbol;
        uint sharePrice;
        uint exitPrice;
   }

   function fractionalize(Item memory _item) public {

        address _owner = _item.owner;
        string memory tokenName = _item.name;
        string memory tokenSymbol = _item.symbol;
        uint sharePrice = _item.sharePrice;
        _shares = new Shares(tokenName, tokenSymbol, _owner,sharePrice);
        
   }

   function getAddressOfShares() public view returns(address){
      return address(_shares);
   }

   function getSharesContract() public view returns(Shares){
      return _shares;
   }

}