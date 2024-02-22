// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.4.24;

import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/@openzeppelin/contracts/token/ERC20/IERC20.sol';

/// @title Interface for WETH9
contract IWETH9 is IERC20 {
    /// @notice Deposit ether to get wrapped ether
    function deposit() external payable;

    /// @notice Withdraw wrapped ether to get ether
    function withdraw(uint256) external;
}
