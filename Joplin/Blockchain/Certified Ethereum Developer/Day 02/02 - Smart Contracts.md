02 - Smart Contracts

- Smart Contracts are
(a) Self-executing
(b) Tamper resistant
<br>
- msg.sender() &rarr; Address of Current Account
<br>
- Calling a function which has keyword `payable` transfers money to the account.
<br>
- msg.sender().transfer &rarr; Transfers money to this address.


* * *
pragma solidity ^0.4.17;

contract Inbox {

string public message;

function Inbox(string initialMessage) public {
    
    message = initialMessage;
    
}

function setMessage(string newMessage) public {
    
    message = newMessage;
}

function getMessage() public view returns (string){
    
    return message;
}
}