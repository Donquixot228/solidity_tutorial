pragma solidity ^0.8.0;

contract Migrations {
    address public owner = msg.sender;
    uint public last_completed_migration;
    modifier restricted(){
        require(msg.sender == owner,
            "This function is restricted to the contact's owner");
        _;
    }

}
