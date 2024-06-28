# ETH-AVAX-PROOF-Intermediate-EVM-Course-Functions-and-Errors-Project
## Introduction
This project implements a BLC voting system using a smart contract written in Solidity. It demonstrates basic voting functionality, including vote casting and determining the winner, while showcasing the use of `require`, `assert`, and `revert` statements for error handling and validation.

## Description
The BLC Voting System allows users to cast votes for predefined candidates. Each voter can vote only once, and the system ensures that only valid candidates receive votes. The contract also provides a function to determine the winner based on the highest number of votes.

### Key Features:
- **Vote Casting**: Users can cast a vote for a candidate of their choice. The contract ensures that each voter can vote only once.
- **Vote Validation**: The contract checks that the candidate being voted for is valid and exists in the list of predefined candidates.
- **Winner Determination**: The contract includes a function to determine the winner based on the number of votes each candidate receives.

### Functions:
1. **Constructor**: 
   - `constructor(string[] memory _candidates)`: Initializes the contract with a list of candidates. The candidates are passed as an array of strings.

2. **castVote**:
   - `function castVote(string memory _candidate) public`: Allows a user to cast a vote for a specified candidate.
   - **require statements**:
     - Ensures that the voter has not already voted.
     - Ensures that the candidate is valid.
   - **Process**:
     - Checks if the voter has already voted by verifying the `hasVoted` mapping.
     - Validates the candidate by checking against the list of predefined candidates.
     - Increments the vote count for the valid candidate.
     - Marks the voter as having voted by updating the `hasVoted` mapping.
     - Emits a `VoteCast` event with the voter's address and the candidate's name.

3. **getWinner**:
   - `function getWinner() public view returns (string memory)`: Returns the candidate with the most votes.
   - **assert statement**:
     - Ensures that there is at least one candidate in the system.
   - **Process**:
     - Iterates over the list of candidates to find the candidate with the highest number of votes.
     - Returns the name of the candidate with the most votes.

### Error Handling:
- **require()**: Used to validate conditions that must be true for the function to execute. In this contract, `require` statements ensure that a voter can only vote once and that votes are cast for valid candidates.
- **assert()**: Used to check for conditions that should never be false. In this contract, `assert` ensures that there is at least one candidate when determining the winner.

### Events:
- **VoteCast**: 
  - `event VoteCast(address indexed voter, string candidate)`: Emitted when a vote is cast, recording the voter's address and the candidate's name.

## Contract Details
The contract consists of the following main components:

- **Mappings**:
  - `votes`: A mapping from candidate names (strings) to their respective vote counts (uint).
  - `hasVoted`: A mapping from voter addresses to their voting status (bool), indicating whether the voter has cast their vote.

- **Array**:
  - `candidates`: An array of candidate names (strings).

- **Constructor**:
  - Initializes the list of candidates and sets initial vote counts to 0.

- **Functions**:
  - `castVote`: Allows a voter to cast their vote for a valid candidate, updating the vote count and marking the voter as having voted.
  - `getWinner`: Determines and returns the candidate with the most votes.

## Deployment
To deploy this contract, follow these steps:
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file named `BLCvotingSystem.sol` and paste the contract code into it.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract by specifying the list of candidates as an array of strings in the deployment parameters.

### Example Deployment:
1. In Remix IDE, after pasting the contract code and compiling it, go to the "Deploy & Run Transactions" tab.
2. In the "Deploy" section, enter the candidates in the "constructor parameters" field as an array of strings. For example: `["Candidate A", "Candidate B", "Candidate C"]`.
3. Click the "Deploy" button to deploy the contract.

## Authors
This contract was developed by [Your Name].

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.
