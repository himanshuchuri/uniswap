// SPDX-License-Identifier: MIT

pragma solidity 0.4.24;

import "/Users/himanshuchuri/Desktop/Solidity_Exp/uniswap/code-sample/goerli/0xe592427a0aece92de3edee1f18e0157c05861564/@openzeppelin/contracts/token/ERC20/ERC20.sol";





library ShortStrings {

    // Used as an identifier for strings longer than 31 bytes.
    bytes32 private constant FALLBACK_SENTINEL = 0x00000000000000000000000000000000000000000000000000000000000000FF;

    /**
     * @dev Encode a string of at most 31 chars into a `ShortString`.
     *
     * This will trigger a `StringTooLong` error is the input string is too long.
     */
    function toShortString(string memory str) internal pure returns (bytes32) {
    bytes memory bstr = bytes(str);
    require(bstr.length <= 31, "StringTooLong");
    
    bytes32 result;
    assembly {
        result := mload(add(bstr, 32))
    }
    return result;
}


    /**
     * @dev Encode a string into a `ShortString`, or write it to storage if it is too long.
     */
    function toShortStringWithFallback(string memory value, string storage store) internal returns (bytes32) {
    bytes storage storedString = bytes(store);
    if (bytes(value).length < 32) {
        return toShortString(value);
    } else {
        require(storedString.length == 0, "FallbackAlreadySet");
        require(bytes(value).length <= 64, "StringTooLongForFallback");
        bytes memory valueBytes = bytes(value);
        require(valueBytes.length <= 64, "StringTooLongForFallback");
        assembly {
            // Get the storage slot of the string storage pointer
            let slot := sload(store_slot)
            // Store the length of the value in the first 32 bytes
            mstore(slot, mload(valueBytes))
            // Store the value itself starting from the next 32 bytes
            mstore(add(slot, 32), add(valueBytes, 32))
        }
        return FALLBACK_SENTINEL;
    }
}
}




library ECDSA {
    enum RecoverError {
        NoError,
        InvalidSignature,
        InvalidSignatureLength,
        InvalidSignatureS
    }


    function _throwError(RecoverError error, bytes32 errorArg) private pure {
        if (error == RecoverError.NoError) {
            return; // no error: do nothing
    }}

    function tryRecover(
        bytes32 hash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal pure returns (address, RecoverError, bytes32) {
        // EIP-2 still allows signature malleability for ecrecover(). Remove this possibility and make the signature
        // unique. Appendix F in the Ethereum Yellow paper (https://ethereum.github.io/yellowpaper/paper.pdf), defines
        // the valid range for s in (301): 0 < s < secp256k1n ÷ 2 + 1, and for v in (302): v ∈ {27, 28}. Most
        // signatures from current libraries generate a unique signature with an s-value in the lower half order.
        //
        // If your library generates malleable signatures, such as s-values in the upper range, calculate a new s-value
        // with 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141 - s1 and flip v from 27 to 28 or
        // vice versa. If your library also generates signatures with 0/1 for v instead 27/28, add 27 to v to accept
        // these malleable signatures as well.
        if (uint256(s) > 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D576E7357A4501DDFE92F46681B20A0) {
            return (address(0), RecoverError.InvalidSignatureS, s);
        }

        // If the signature is valid (and not malleable), return the signer address
        address signer = ecrecover(hash, v, r, s);
        if (signer == address(0)) {
            return (address(0), RecoverError.InvalidSignature, bytes32(0));
        }

        return (signer, RecoverError.NoError, bytes32(0));
    }

    function recover(bytes32 hash, uint8 v, bytes32 r, bytes32 s) internal pure returns (address) {
        (address recovered, RecoverError error, bytes32 errorArg) = tryRecover(hash, v, r, s);
        _throwError(error, errorArg);
        return recovered;
    }

}


library MessageHashUtils {
    function toTypedDataHash(bytes32 domainSeparator, bytes32 structHash) internal pure returns (bytes32 digest) {
        /// @solidity memory-safe-assembly
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 0x19)
            mstore(add(ptr, 1), 0x01)
            mstore(add(ptr, 0x02), domainSeparator)
            mstore(add(ptr, 0x22), structHash)
            digest := keccak256(ptr, 0x42)
        }
    }

}

contract EIP712{

    bytes32 private constant TYPE_HASH =
        keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)");

    // Cache the domain separator as an immutable value, but also store the chain id that it corresponds to, in order to
    // invalidate the cached domain separator if the chain id changes.
    bytes32  _cachedDomainSeparator;
    uint256  _cachedChainId;
    address  _cachedThis;

    bytes32  _hashedName;
    bytes32  _hashedVersion;

    bytes32  _name;
    bytes32  _version;
    string  _nameFallback;
    string  _versionFallback;

    function _buildDomainSeparator() private view returns (bytes32) {
        return keccak256(abi.encode(TYPE_HASH, _hashedName, _hashedVersion, _cachedChainId, address(this)));
    }

    
    constructor(string memory name, string memory version, uint256 chainId) {
        _name = ShortStrings.toShortStringWithFallback(name, _nameFallback);

        _version = ShortStrings.toShortStringWithFallback(version, _versionFallback);

        _hashedName = keccak256(bytes(name));
        _hashedVersion = keccak256(bytes(version));

        _cachedChainId = chainId;
        _cachedDomainSeparator = _buildDomainSeparator();
        _cachedThis = address(this);
    }


    function _domainSeparatorV4() internal view returns (bytes32) {
        if (address(this) == _cachedThis) {
            return _cachedDomainSeparator;
        } else {
            return _buildDomainSeparator();
        }
    }

    function _hashTypedDataV4(bytes32 structHash) internal view returns (bytes32) {
        return MessageHashUtils.toTypedDataHash(_domainSeparatorV4(), structHash);
    }



}


contract Nonces {
    /**
     * @dev The nonce used for an `account` is not the expected current nonce.
     */

    mapping(address => uint256) private _nonces;

    /**
     * @dev Returns the next unused nonce for an address.
     */
    function nonces(address owner) public view returns (uint256) {
        return _nonces[owner];
    }


    function _useNonce(address owner) internal returns (uint256) {
        // For each account, the nonce has an initial value of 0, can only be incremented by one, and cannot be
        // decremented or reset. This guarantees that the nonce never overflows.
            // It is important to do x++ and not ++x here.
            return _nonces[owner]++;
        
    }
}

contract IERC20Permit is Nonces,EIP712,TERC20  {

    bytes32 private constant PERMIT_TYPEHASH =
        keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) public{
    

        bytes32 structHash = keccak256(abi.encode(PERMIT_TYPEHASH, owner, spender, value, _useNonce(owner), deadline));

        bytes32 hash = _hashTypedDataV4(structHash);

        address signer = ECDSA.recover(hash, v, r, s);

        _approve(owner, spender, value);
    }

    
    // @inheritdoc IERC20Permit

    function nonces(address owner) public view returns (uint256) {
        return super.nonces(owner);
    }

    
    //@inheritdoc IERC20Permit
    
    // solhint-disable-next-line func-name-mixedcase
    function DOMAIN_SEPARATOR() external view returns (bytes32) {
        return _domainSeparatorV4();
    }
}
