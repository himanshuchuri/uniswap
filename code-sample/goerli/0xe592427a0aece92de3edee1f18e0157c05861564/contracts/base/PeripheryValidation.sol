// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.4.24;

import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/base/BlockTimestamp.sol';

//abstract contract PeripheryValidation is BlockTimestamp {
contract PeripheryValidation is BlockTimestamp {

    modifier checkDeadline(uint256 deadline) {
        require(_blockTimestamp() <= deadline, 'Transaction too old');
        _;
    }
}
