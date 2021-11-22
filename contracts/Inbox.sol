pragma solidity ^0.4.17;
// linter warnings (red underline) about pragma version can igonored!

// contract code will go here

contract Lottery{
    address public manager;
    address[] public players;

    function Lottery() public{
        manager=msg.sender;
    } 
    function enter() public payable{
        players.push(msg.sender);
    }
}
