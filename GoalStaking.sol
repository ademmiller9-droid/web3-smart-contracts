// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Deployed to Sepolia Testnet at: 0x72f40579DBE5FA3F72fAb8bb7fC006EC89E3A19A

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract GoalStaking {
    IERC20 public stakingToken;

    mapping(address => uint256) public stakedBalance;

    event Staked(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _stakingToken) {
        stakingToken = IERC20(_stakingToken);
    }

    function stake(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than 0");
        require(
            stakingToken.transferFrom(msg.sender, address(this), _amount),
            "Transfer failed"
        );
        stakedBalance[msg.sender] += _amount;
        emit Staked(msg.sender, _amount);
    }

    function withdraw(uint256 _amount) external {
        require(
            stakedBalance[msg.sender] >= _amount,
            "Insufficient staked balance"
        );
        stakedBalance[msg.sender] -= _amount;
        require(stakingToken.transfer(msg.sender, _amount), "Transfer failed");
        emit Withdrawn(msg.sender, _amount);
    }
}
