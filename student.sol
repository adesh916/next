// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRecords {
    struct Student {
        uint id;
        string name;
        uint age;
        string course;
        uint grade;
    }

    Student[] public students;
    mapping(uint => uint) public studentIndex; // Maps student ID to index in array
    uint public studentCount;

    // Event for tracking addition of students
    event StudentAdded(uint id, string name);

    // Constructor to initialize the student count
    constructor() {
        studentCount = 0;
    }

    // Function to add a new student to the records
    function addStudent(string memory _name, uint _age, string memory _course, uint _grade) public {
        studentCount += 1;
        students.push(Student(studentCount, _name, _age, _course, _grade));
        studentIndex[studentCount] = students.length - 1;
        emit StudentAdded(studentCount, _name);
    }

    // Function to get details of a student by their ID
    function getStudentById(uint _id) public view returns (uint, string memory, uint, string memory, uint) {
        require(_id > 0 && _id <= studentCount, "Student ID is invalid");
        Student storage student = students[studentIndex[_id]];
        return (student.id, student.name, student.age, student.course, student.grade);
    }

    // Fallback function to handle any Ether sent to the contract
    fallback() external payable {
        // Log a message or handle in any specific way
    }

    // Function to check the balance of Ether in the contract (optional)
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Receive function to handle Ether directly sent to the contract
    receive() external payable {}
}
