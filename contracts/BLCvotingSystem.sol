// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BLCVotingSystem {
    // Mapping of candidates to their vote counts
    mapping(string => uint256) public votes;

    // Array of candidate names
    string[] public candidates;

    // Mapping of voters to their voted status
    mapping(address => bool) public hasVoted;

    // Event emitted when a vote is cast
    event VoteCast(address voter, string candidate);

    // Constructor to initialize the contract
    constructor(string[] memory candidateNames) {
        candidates = candidateNames;
        for (uint256 i = 0; i < candidates.length; i++) {
            votes[candidates[i]] = 0;
        }
    }

    // Function to cast a vote
    function castVote(string memory _candidate) public {
        // Require that the voter has not already voted
        require(!hasVoted[msg.sender], "You have already voted");

        // Require that the candidate is valid
        bool validCandidate = false;
        for (uint256 i = 0; i < candidates.length; i++) {
            if (keccak256(abi.encodePacked(candidates[i])) == keccak256(abi.encodePacked(_candidate))) {
                validCandidate = true;
                break;
            }
        }
        require(validCandidate, "Invalid candidate");

        // Increment the vote count for the candidate
        votes[_candidate]++;

        // Set the voter as having voted
        hasVoted[msg.sender] = true;

        // Emit the VoteCast event
        emit VoteCast(msg.sender, _candidate);
    }

    // Function to end the voting period
    function endVotingPeriod() public pure {
        revert("Voting period has ended");
    }

    // Function to get the winner of the election
    function getWinner() public view returns (string memory) {
        string memory winner = candidates[0];
        uint256 maxVotes = votes[winner];

        for (uint256 i = 1; i < candidates.length; i++) {
            if (votes[candidates[i]] > maxVotes) {
                winner = candidates[i];
                maxVotes = votes[candidates[i]];
            }
        }

        // Ensure that the winner has received votes
        assert(maxVotes > 0);

        return winner;
    }
}
