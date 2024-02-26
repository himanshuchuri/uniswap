// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.4.24;

import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract TransferHelper is TERC20 {

    /// @notice Transfers tokens from the targeted address to the given destination
    /// @notice Errors with 'STF' if transfer fails
    /// @param token The contract address of the token to be transferred
    /// @param from The originating address from which the tokens will be transferred
    /// @param to The destination address of the transfer
    /// @param value The amount to be transferred
    TERC20 private terc20;

    constructor(address _terc20) {
        terc20 = TERC20(_terc20);
    }

    function safeTransferFrom(address token,address from, address to,uint256 value) internal {
        require(terc20.transferFrom(from, to, value), "STF");
    }

    /// @notice Transfers tokens from msg.sender to a recipient
    /// @dev Errors with ST if transfer fails
    /// @param token The contract address of the token which will be transferred
    /// @param to The recipient of the transfer
    /// @param value The value of the transfer
    function safeTransfer(address token, address to, uint256 value) internal {
        require(terc20.transfer(to, value), "ST");
    }

    /// @notice Approves the stipulated contract to spend the given allowance in the given token
    /// @dev Errors with 'SA' if transfer fails
    /// @param token The contract address of the token to be approved
    /// @param to The target of the approval
    /// @param value The amount of the given token the target will be allowed to spend
    function safeApprove(address token, address to, uint256 value) internal {
        require(terc20.approve(token, value), "SA");
    }

    /// @notice Transfers ETH to the recipient address
    /// @dev Fails with `STE`
    /// @param to The destination of the transfer
    /// @param value The value to be transferred
    function safeTransferETH(address to, uint256 value) external {
        ///(bool success, ) = to.call{value: value}(new bytes(0));
        ///require(success, "STE");
        require(to.call.value(value)(), "STE");
    }
}
