// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Shares is ERC20{
    uint _sharesCount = 100;
    uint public _sharePrice;

    //mapping() users shares
    
    
    constructor(string memory _name, string memory _symbol, address _owner, uint sharePrice) ERC20(_name, _symbol){
        _mint(_owner, _sharesCount);
        _sharePrice = sharePrice;
    }

    function buyShare(address payable _to, uint _amount) public payable{
        require(_amount<=_sharesCount,"insufficient shares");
        require(_amount*_sharePrice==msg.value,"insufficient payment");
        transfer(_to, _amount);
        _sharesCount -= _amount;
    }

    function sellShare(address payable _to, uint _amount) public payable{
        require(balanceOf(_to)>0,"You do not have share");
        (bool success, )= _to.call{value:_amount*_sharePrice}("");
        require(success,"call failed");
        _sharesCount += _amount;

    }

    /*
    total payment of user
    */
    function totalPaymentOf() public view returns(uint){}

    /**
     * left shares in the contract
     */
    function leftShares() public view returns(uint){}

    /**
     * redeem nft msg.sender and send left shares to the holders.
     */
    function redeem() public payable{} 
}