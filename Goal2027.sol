// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Deployed to Sepolia Testnet at: 0xcd61b74782352d5817d17d25c63dd9850795ebe9

contract Goal2027 {
    string public myGoal = "Target 80k USD by 2027";

    function getGoal() public view returns (string memory) {
        return myGoal;
    }
}
