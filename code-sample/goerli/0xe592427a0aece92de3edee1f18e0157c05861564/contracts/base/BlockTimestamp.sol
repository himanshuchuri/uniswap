// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.4.24;

/// @title Function for getting block timestamp
/// @dev Base contract that is overridden for tests
//abstract contract BlockTimestamp {
contract BlockTimestamp {

    /// @dev Method that exists purely to be overridden for tests
    /// @return The current block timestamp
    //function _blockTimestamp() internal view virtual returns (uint256) {
    function _blockTimestamp() internal view returns (uint256) {
        return block.timestamp;
    }
}
