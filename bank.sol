// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.10;

contract Bank {
    mapping(address => uint) public userAccount;
    mapping(address => bool) public isUserExist;

    function createAccount() public payable returns(string memory){
        require(!isUserExist[msg.sender], "Account Already created!");
        userAccount[msg.sender] = msg.value;
        isUserExist[msg.sender] = true;
        return "Account created";
    }

    function deposit(uint256 amount) public payable returns(string memory){
        require(isUserExist[msg.sender], "Account not created!");
        require(amount > 0, "Amount should be greater than 0");
        userAccount[msg.sender] += amount;
        return "Deposit successful!";
    }

    function withdraw(uint256 amount) public payable returns(string memory){
        require(isUserExist[msg.sender], "Account not created!");
        require(amount <= userAccount[msg.sender], "Insufficient funds.");
        userAccount[msg.sender] -= amount;
        return "Withdrawal completed.";
    }
    
    function getBalance() public view returns (uint256){
       return userAccount[msg.sender];
   }

}