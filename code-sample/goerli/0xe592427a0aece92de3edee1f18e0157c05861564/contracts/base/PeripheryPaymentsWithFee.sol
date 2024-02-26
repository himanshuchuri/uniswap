// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.4.24;

//import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/@uniswap/v3-core/contracts/libraries/LowGasSafeMath.sol';

import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/base/PeripheryPayments.sol';
import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/interfaces/IPeripheryPaymentsWithFee.sol';

import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/interfaces/external/IWETH9.sol';
import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/libraries/TransferHelper.sol';

//abstract contract PeripheryPaymentsWithFee is PeripheryPayments, IPeripheryPaymentsWithFee {
contract PeripheryPaymentsWithFee is PeripheryPayments, IPeripheryPaymentsWithFee {

    using LowGasSafeMath for uint256;

    TransferHelper private thelper;

    constructor(address _thelper) {
        thelper = TransferHelper(_thelper);
    }

    // @inheritdoc IPeripheryPaymentsWithFee
    function unwrapWETH9WithFee(
        uint256 amountMinimum,
        address recipient,
        uint256 feeBips,
        address feeRecipient
    ) external payable {
        require(feeBips > 0 && feeBips <= 100);

        uint256 balanceWETH9 = IWETH9(WETH9).balanceOf(address(this));
        require(balanceWETH9 >= amountMinimum, 'Insufficient WETH9');

        if (balanceWETH9 > 0) {
            IWETH9(WETH9).withdraw(balanceWETH9);
            uint256 feeAmount = balanceWETH9.mul(feeBips) / 10000;//10_000;
            if (feeAmount > 0) thelper.safeTransferETH(feeRecipient, feeAmount);
            thelper.safeTransferETH(recipient, balanceWETH9 - feeAmount);
        }
    }

    // @inheritdoc IPeripheryPaymentsWithFee
    function sweepTokenWithFee(
        address token,
        uint256 amountMinimum,
        address recipient,
        uint256 feeBips,
        address feeRecipient
    ) external payable {
        require(feeBips > 0 && feeBips <= 100);

        uint256 balanceToken = IERC20(token).balanceOf(address(this));
        require(balanceToken >= amountMinimum, 'Insufficient token');

        if (balanceToken > 0) {
            uint256 feeAmount = balanceToken.mul(feeBips) / 10000;//10_000;
            if (feeAmount > 0) TransferHelper.safeTransfer(token, feeRecipient, feeAmount);
            TransferHelper.safeTransfer(token, recipient, balanceToken - feeAmount);
        }
    }
}
