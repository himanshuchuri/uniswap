// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.4.24;

import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/interfaces/IPeripheryImmutableState.sol';

/// @title Immutable state
/// @notice Immutable state used by periphery contracts
//abstract contract PeripheryImmutableState is IPeripheryImmutableState {
contract PeripheryImmutableState is IPeripheryImmutableState {

    // @inheritdoc IPeripheryImmutableState
    //address public immutable override factory;
    address public factory;

    // @inheritdoc IPeripheryImmutableState
    //address public immutable override WETH9;
    address public WETH9;


    constructor(address _factory, address _WETH9) {
        factory = _factory;
        WETH9 = _WETH9;
    }
}
