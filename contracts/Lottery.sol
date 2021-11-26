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
        require(msg.value>0.01 ether);
        players.push(msg.sender);
    }
    function random() private view returns (uint){
        return uint(sha3(block.difficulty,now,players));
    }
    function pickWinner() public restricted{
        uint index=random() % players.length;
        address winner=players[index];
        winner.transfer(this.balance);
        players=new address[](0);

    }
    modifier restricted(){
        require(msg.sender==manager);
        _;
    }

    function getPlayers() public view returns(address[]){
        return players;
    }
}
