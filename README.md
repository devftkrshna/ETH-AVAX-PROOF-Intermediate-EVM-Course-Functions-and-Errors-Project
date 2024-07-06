# ETH-AVAX-PROOF-Intermediate-EVM-Course-Functions-and-Errors-Project

## Introduction
This project implements a School Grading System using a smart contract written in Solidity. It demonstrates basic functionality for managing student grades while showcasing the use of `require`, `assert`, and `revert` statements for error handling and validation.

## Description
The School Grading System allows teachers to add students, assign grades to them, and for students to check their grades. The contract ensures that only teachers can perform certain actions and that grades are valid. The contract also includes a function to verify the internal consistency of the system.

### Key Features:
- **Student Management**: Teachers can add new students to the system.
- **Grade Assignment**: Teachers can assign grades to students, ensuring the grades are within a valid range.
- **Grade Checking**: Students can check their assigned grades.
- **System Consistency**: The contract includes a function to verify that the number of graded students does not exceed the total number of students.

### Functions:
1. **Constructor**:
   - `constructor(address[] memory initialTeachers)`: Initializes the contract with a list of teachers.

2. **addStudent**:
   - `function addStudent(address _studentAddress, string memory _name) public`: Allows a teacher to add a student.
   - **require statements**:
     - Ensures that the student does not already exist.
   - **Process**:
     - Adds the student to the `students` mapping with initial grade values.

3. **assignGrade**:
   - `function assignGrade(address _studentAddress, uint8 _grade) public`: Allows a teacher to assign a grade to a student.
   - **require statements**:
     - Ensures that the student exists.
     - Ensures that the grade is valid.
   - **Process**:
     - Updates the student's grade and marks them as graded.
     - Emits a `GradeAssigned` event with the student's address and grade.

4. **checkGrade**:
   - `function checkGrade() public view returns (string memory name, uint8 grade)`: Allows students to check their grades.
   - **require statements**:
     - Ensures that the student exists.
     - Ensures that the grade has been assigned.
   - **Process**:
     - Returns the student's name and grade.

5. **withdrawGrade**:
   - `function withdrawGrade(address _studentAddress) public`: Allows a teacher to withdraw a student's grade.
   - **revert statements**:
     - Reverts if the student does not exist.
   - **Process**:
     - Resets the student's grade and graded status.

6. **checkConsistency**:
   - `function checkConsistency(address[] memory studentAddresses) public view`: Checks the internal consistency of the contract.
   - **assert statements**:
     - Ensures that the number of graded students does not exceed the total number of students.
   - **Process**:
     - Iterates through the list of student addresses to count graded students and ensures the consistency of the data.

### Error Handling:
- **require()**: Used to validate conditions that must be true for the function to execute. In this contract, `require` statements ensure valid operations, such as unique students and valid grades.
- **revert()**: Used to handle conditions where an operation cannot proceed. In this contract, `revert` is used in the `withdrawGrade` function to handle non-existent students.
- **assert()**: Used to check for conditions that should never be false. In this contract, `assert` ensures the internal consistency of the student data.

### Events:
- **GradeAssigned**:
  - `event GradeAssigned(address indexed student, uint8 grade)`: Emitted when a grade is assigned, recording the student's address and the grade.

## Contract Details
The contract consists of the following main components:

- **Mappings**:
  - `students`: A mapping from student addresses to their details (`Student` struct).
  - `teachers`: A mapping from teacher addresses to their status, indicating whether the address belongs to a teacher.

- **Constructor**:
  - Initializes the list of teachers.

- **Functions**:
  - `addStudent`: Allows a teacher to add a student.
  - `assignGrade`: Allows a teacher to assign a grade to a student.
  - `checkGrade`: Allows students to check their grades.
  - `withdrawGrade`: Allows a teacher to withdraw a student's grade.
  - `checkConsistency`: Ensures the internal consistency of the contract data.

## Deployment
To deploy this contract, follow these steps:
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file named `SchoolGradingSystem.sol` and paste the contract code into it.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract by specifying the list of teacher addresses as an array of addresses in the deployment parameters.

### Example Deployment:
1. In Remix IDE, after pasting the contract code and compiling it, go to the "Deploy & Run Transactions" tab.
2. In the "Deploy" section, enter the teacher addresses in the "constructor parameters" field as an array. For example: `["0xAbc123...", "0xDef456..."]`.
3. Click the "Deploy" button to deploy the contract.

## Authors
This contract was developed by Vaibhav Sharma (vaibhavkhandal445@gmail.com).

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.
