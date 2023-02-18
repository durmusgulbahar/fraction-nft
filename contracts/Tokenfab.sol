// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./Shares.sol";
import "./Fractionalizer.sol";
import "./NFTCreator.sol";

contract Tokenfab{
    ERC20 _token;
    

    struct Item{ 
        address owner;
        string name;
        string symbol;
        uint sharePrice;
        uint exitPrice;
   }


    constructor(){
        
    }
}