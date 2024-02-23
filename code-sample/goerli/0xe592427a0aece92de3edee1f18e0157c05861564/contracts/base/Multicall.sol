// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity 0.4.24;
pragma experimental ABIEncoderV2;

import '/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/interfaces/IMulticall.sol';

contract Multicall {
    function multicall(bytes[] data) external payable returns (bytes[]) {
        // Split the data into individual call datas
        uint256 dataSize = data.length;
        uint256 numData = dataSize / 0x20; // Assuming each call data is 32 bytes (256 bits) long
        require(numData * 0x20 == dataSize); // Ensure the data is properly aligned

        bytes[] memory results = new bytes[](numData);
        bytes memory temp;
        for (uint256 i = 0; i < numData; i++) {
            bytes memory callData;
            temp = data[i];
            assembly {
                callData := mload(add(temp, add(0x20, mul(i, 0x20))))
            }

            bool success;
            bytes memory result;
            assembly {
                success := delegatecall(sub(gas, 5000), address, add(callData, 0x20), mload(callData), 0, 0)
                result := mload(0)
            }

            if (!success) {
               // Next 5 lines from https://ethereum.stackexchange.com/a/83577
                if (result.length < 68) revert();
                assembly {
                    result := add(result, 0x04)
                }
                bytes memory revertReason = new bytes(result.length - 4);
                for (uint256 j = 0; j < revertReason.length; j++) {
                    revertReason[j] = result[j + 4];
                }
                revert(string(revertReason));
            }

            results[i] = result;
    }
}
}