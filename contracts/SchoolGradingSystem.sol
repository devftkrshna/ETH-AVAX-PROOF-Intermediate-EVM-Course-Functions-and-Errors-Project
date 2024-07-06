// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGradingSystem {
    // Struct to represent a student
    struct Student {
        string name;
        uint8 grade;
        bool graded;
    }

    // Mapping of student addresses to their details
    mapping(address => Student) public students;

    // Mapping of teacher addresses to their status
    mapping(address => bool) public teachers;

    // Event emitted when a grade is assigned
    event GradeAssigned(address student, uint8 grade);

    // Modifier to restrict access to teachers
    modifier onlyTeacher() {
        require(teachers[msg.sender], "Only teachers can perform this action");
        _;
    }

    // Constructor to initialize the contract with some teachers
    constructor(address[] memory initialTeachers) {
        for (uint256 i = 0; i < initialTeachers.length; i++) {
            teachers[initialTeachers[i]] = true;
        }
    }

    // Function to add a student
    function addStudent(address _studentAddress, string memory _name) public onlyTeacher {
        require(bytes(students[_studentAddress].name).length == 0, "Student already exists");
        students[_studentAddress] = Student(_name, 0, false);
    }

    // Function to assign a grade to a student
    function assignGrade(address _studentAddress, uint8 _grade) public onlyTeacher {
        require(bytes(students[_studentAddress].name).length > 0, "Student does not exist");
        require(_grade <= 100, "Invalid grade");
        students[_studentAddress].grade = _grade;
        students[_studentAddress].graded = true;

        emit GradeAssigned(_studentAddress, _grade);
    }

    // Function for students to check their grade
    function checkGrade() public view returns (string memory name, uint8 grade) {
        require(bytes(students[msg.sender].name).length > 0, "You are not a student in this system");
        require(students[msg.sender].graded, "Grade not assigned yet");

        return (students[msg.sender].name, students[msg.sender].grade);
    }

    // Function to withdraw a student's grade
    function withdrawGrade(address _studentAddress) public onlyTeacher {
        if (bytes(students[_studentAddress].name).length == 0) {
            revert("Student does not exist");
        }
        students[_studentAddress].grade = 0;
        students[_studentAddress].graded = false;
    }

    // Function to check contract consistency
    function checkConsistency(address[] memory studentAddresses) public view {
        uint256 totalStudents = studentAddresses.length;
        uint256 gradedStudents = 0;

        // Count the number of graded students
        for (uint256 i = 0; i < totalStudents; i++) {
            if (students[studentAddresses[i]].graded) {
                gradedStudents++;
            }
        }
        
        // Ensure the number of graded students does not exceed total students
        assert(gradedStudents <= totalStudents);
    }
}
