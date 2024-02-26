pragma solidity 0.4.24;

import "/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/@openzeppelin/contracts/drafts/IERC20Permit.sol";
import "/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/interfaces/ISelfPermit.sol";
import "/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/interfaces/external/IERC20PermitAllowed.sol";
import "/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/contracts/base/ExtFxnsSelfPermit.sol";

/// @title Self Permit
/// @notice Functionality to call permit on any EIP-2612-compliant token for use in the route
/// @dev These functions are expected to be embedded in multicalls to allow EOAs to approve a contract and call a function
/// that requires an approval in a single transaction.

contract SelfPermit is ISelfPermit,T {
    // @inheritdoc ISelfPermi

    // @inheritdoc ISelfPermit
    function selfPermitIfNecessary(
        address token,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external payable {
        if (IERC20(token).allowance(msg.sender, address(this)) < value) {
            T.selfPermit(token, value, deadline, v, r, s);
        }
    }

    // @inheritdoc ISelfPermit
    function selfPermitAllowedIfNecessary(
        address token,
        uint256 nonce,
        uint256 expiry,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external payable {
        if (
            IERC20(token).allowance(msg.sender, address(this)) <
            ((2 ** 256) - 1)
        )
            //type(uint256).max)
            T.selfPermitAllowed(token, nonce, expiry, v, r, s);
    }
}
