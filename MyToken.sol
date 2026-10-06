// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Deployed to Sepolia Testnet at: 0x5b16DdbD750552fFe163879a9ED81328B94662c7

contract GoalToken is ERC20 {
    constructor() ERC20("Goal Token", "GOAL") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}
