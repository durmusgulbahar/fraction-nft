// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Import the openzepplin contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import { IERC721Metadata } from "@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol";

// NFTee is  ERC721 signifies that the contract we are creating imports ERC721 and follows ERC721 contract from openzeppelin
contract NFTCreator is ERC721URIStorage {

    uint public _tokenIds=0;
    

    mapping(uint=>Item) _items; // 0 => Item

    struct Item{ 
        address owner;
        string name;
        string symbol;
        uint sharePrice;
        uint exitPrice;
   }

    constructor(string memory _name, string memory _symbol, string memory _metadataURL,uint _exitPrice) ERC721(_name, _symbol) {
        // mint an NFT to yourself
        address _owner = msg.sender;
        _mint(address(this), _tokenIds);
        _setTokenURI( _tokenIds,_metadataURL);

        _items[_tokenIds] = Item(
            _owner,
            _name,
            _symbol,
            _exitPrice/100,
            _exitPrice
        ) ;

        _tokenIds++;
    }

    function getItemOwner(uint _tokenId) public view returns(address){
        return _items[_tokenId].owner;
    }
    function getItemName(uint _tokenId) public view returns(string memory){
        return _items[_tokenId].name;
    }

    function getItemSymbol(uint _tokenId) public view returns(string memory){
        return _items[_tokenId].symbol;
    }
    function getItemExitPrice(uint _tokenId) public view returns(uint){
        return _items[_tokenId].exitPrice;
    }

    function getItemSharePrice(uint _tokenId) public view returns(uint){
        return _items[_tokenId].sharePrice;
    }

    
}