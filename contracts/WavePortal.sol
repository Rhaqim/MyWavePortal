// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 public totalWaves;

    event NewWave(address indexed from, string message, uint256 timestamp);

    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    Wave [] waves;
    
    constructor() {
        console.log("Yo yo, I am a contract and i'm alive!");
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        uint256 prizeMoney = 0.001 ether;

        require(prizeMoney <= address(this).balance, "You don't have enough money!");

        (bool success, ) = (msg.sender).call{value: prizeMoney}("");

        require(success, "Failed to send ether!");	

    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("Total waves: %d", totalWaves);
        return totalWaves;
    }
    
}