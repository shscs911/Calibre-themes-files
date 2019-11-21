03 - Error Handling

- ## Assert()
    - Test for internal errors, and to check invariants
    - Divide or modulo by zero 
    <br>
- ## Require()
    - Validate user inputs ie. require(input<20)
    - function setProfile(string memory_name)public {
        require(msg.sender == owner);
        
        //do something;
        }
    <br>    
- ## Revert()
    - It will allow you to return a value.
    - It will refund any remaining gas to the caller.