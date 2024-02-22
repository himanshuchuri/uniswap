// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.4.24;
pragma experimental ABIEncoderV2;

import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/interfaces/IMulticall.sol';

contract Multicall {
    function multicall(bytes data) external payable returns (bytes[]) {
        // Split the data into individual call datas
        uint256 dataSize = data.length;
        uint256 numData = dataSize / 0x20; // Assuming each call data is 32 bytes (256 bits) long
        require(numData * 0x20 == dataSize); // Ensure the data is properly aligned

        bytes[] memory results = new bytes[](numData);
        for (uint256 i = 0; i < numData; i++) {
            bytes memory callData;
            assembly {
                callData := mload(add(data, add(0x20, mul(i, 0x20))))
            }

            bool success;
            bytes memory result;
            assembly {
                success := delegatecall(sub(gas, 5000), address, add(callData, 0x20), mload(callData), 0, 0)
                result := mload(0)
            }

            if (!success) {
                revert(result);
            }

            results[i] = result;
        }

        return results;
    }
}