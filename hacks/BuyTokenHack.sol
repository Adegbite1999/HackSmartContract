// SPDX-License-Identifier: MIT
pragma solidity ^0.4.10;
import "../contracts/SolidityHackingWorkshop.sol";

/*
* @title: HSC.
* @author: Anthony (fps) https://github.com/fps8k .
* @dev: 
*/

/*
* @dev:
*
* Vulnerabilities observed:
* - `owner` is not secured, it can be reassigned on deploy.
* - Thus, anyone who deploys this contract can manipulate the price.
* - Price can also be manipulated without changing owner.
* - Price can also be manipulated without changing owner.
*/

contract Hack is BuyToken
{
    BuyToken _buy_token = new BuyToken();

    constructor(uint256 _price, uint256 _wealth)
    {
        price = _price;
        balances[msg.sender] += _wealth;
        owner = msg.sender;
    }
    



    /*
    * @dev:
    *
    * Changes the price value without regards to the protection offered by the msg.sender code on the setPrice() function.
    */
    function manipulatePrice(uint256 _newPrice)
    {
        price = _newPrice;
    }




    /*
    * @dev:
    *
    * Changes the price value without regards to the protection offered by the msg.sender code on the setPrice() function.
    */
    function manipulateWealth(uint256 _newWealth)
    {
        balances[msg.sender] += _newWealth;
    }
}