{

    function abi_decode_available_length_t_bytes_memory_ptr(src, length, end) -> array {
        array := allocateMemory(array_allocation_size_t_bytes_memory_ptr(length))
        mstore(array, length)
        let dst := add(array, 0x20)
        if gt(add(src, length), end) { revert(0, 0) }
        copy_calldata_to_memory(src, dst, length)
    }

    function abi_decode_available_length_t_string_memory_ptr_fromMemory(src, length, end) -> array {
        array := allocateMemory(array_allocation_size_t_string_memory_ptr(length))
        mstore(array, length)
        let dst := add(array, 0x20)
        if gt(add(src, length), end) { revert(0, 0) }
        copy_memory_to_memory(src, dst, length)
    }

    function abi_decode_t_address(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_address(value)
    }

    // bytes[]
    function abi_decode_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(offset, end) -> arrayPos, length {
        if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
        length := calldataload(offset)
        if gt(length, 0xffffffffffffffff) { revert(0, 0) }
        arrayPos := add(offset, 0x20)
        if gt(add(arrayPos, mul(length, 0x20)), end) { revert(0, 0) }
    }

    function abi_decode_t_bytes32(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_bytes32(value)
    }

    // bytes
    function abi_decode_t_bytes_calldata_ptr(offset, end) -> arrayPos, length {
        if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
        length := calldataload(offset)
        if gt(length, 0xffffffffffffffff) { revert(0, 0) }
        arrayPos := add(offset, 0x20)
        if gt(add(arrayPos, mul(length, 0x01)), end) { revert(0, 0) }
    }

    // bytes
    function abi_decode_t_bytes_memory_ptr(offset, end) -> array {
        if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
        let length := calldataload(offset)
        array := abi_decode_available_length_t_bytes_memory_ptr(add(offset, 0x20), length, end)
    }

    function abi_decode_t_int256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_int256(value)
    }

    function abi_decode_t_int256_fromMemory(offset, end) -> value {
        value := mload(offset)
        validator_revert_t_int256(value)
    }

    // string
    function abi_decode_t_string_memory_ptr_fromMemory(offset, end) -> array {
        if iszero(slt(add(offset, 0x1f), end)) { revert(0, 0) }
        let length := mload(offset)
        array := abi_decode_available_length_t_string_memory_ptr_fromMemory(add(offset, 0x20), length, end)
    }

    // struct ISwapRouter.ExactInputParams
    function abi_decode_t_struct$_ExactInputParams_$2879_memory_ptr(headStart, end) -> value {
        if slt(sub(end, headStart), 0xa0) { revert(0, 0) }
        value := allocateMemory(0xa0)

        {
            // path

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

            mstore(add(value, 0x00), abi_decode_t_bytes_memory_ptr(add(headStart, offset), end))

        }

        {
            // recipient

            let offset := 32

            mstore(add(value, 0x20), abi_decode_t_address(add(headStart, offset), end))

        }

        {
            // deadline

            let offset := 64

            mstore(add(value, 0x40), abi_decode_t_uint256(add(headStart, offset), end))

        }

        {
            // amountIn

            let offset := 96

            mstore(add(value, 0x60), abi_decode_t_uint256(add(headStart, offset), end))

        }

        {
            // amountOutMinimum

            let offset := 128

            mstore(add(value, 0x80), abi_decode_t_uint256(add(headStart, offset), end))

        }

    }

    // struct ISwapRouter.ExactInputSingleParams
    function abi_decode_t_struct$_ExactInputSingleParams_$2860_calldata_ptr(offset, end) -> value {
        if slt(sub(end, offset), 256) { revert(0, 0) }
        value := offset
    }

    // struct ISwapRouter.ExactOutputParams
    function abi_decode_t_struct$_ExactOutputParams_$2923_calldata_ptr(offset, end) -> value {
        if slt(sub(end, offset), 160) { revert(0, 0) }
        value := offset
    }

    // struct ISwapRouter.ExactOutputSingleParams
    function abi_decode_t_struct$_ExactOutputSingleParams_$2904_calldata_ptr(offset, end) -> value {
        if slt(sub(end, offset), 256) { revert(0, 0) }
        value := offset
    }

    // struct SwapRouter.SwapCallbackData
    function abi_decode_t_struct$_SwapCallbackData_$1394_memory_ptr(headStart, end) -> value {
        if slt(sub(end, headStart), 0x40) { revert(0, 0) }
        value := allocateMemory(0x40)

        {
            // path

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

            mstore(add(value, 0x00), abi_decode_t_bytes_memory_ptr(add(headStart, offset), end))

        }

        {
            // payer

            let offset := 32

            mstore(add(value, 0x20), abi_decode_t_address(add(headStart, offset), end))

        }

    }

    function abi_decode_t_uint160(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint160(value)
    }

    function abi_decode_t_uint24(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint24(value)
    }

    function abi_decode_t_uint256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_t_uint8(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint8(value)
    }

    function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_addresst_uint256t_address(headStart, dataEnd) -> value0, value1, value2 {
        if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_addresst_uint256t_addresst_uint256t_address(headStart, dataEnd) -> value0, value1, value2, value3, value4 {
        if slt(sub(dataEnd, headStart), 160) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 96

            value3 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 128

            value4 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_addresst_uint256t_uint256t_uint8t_bytes32t_bytes32(headStart, dataEnd) -> value0, value1, value2, value3, value4, value5 {
        if slt(sub(dataEnd, headStart), 192) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 96

            value3 := abi_decode_t_uint8(add(headStart, offset), dataEnd)
        }

        {

            let offset := 128

            value4 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
        }

        {

            let offset := 160

            value5 := abi_decode_t_bytes32(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

            value0, value1 := abi_decode_t_array$_t_bytes_calldata_ptr_$dyn_calldata_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_int256t_int256_fromMemory(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_int256_fromMemory(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_int256_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_int256t_int256t_bytes_calldata_ptr(headStart, dataEnd) -> value0, value1, value2, value3 {
        if slt(sub(dataEnd, headStart), 96) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_int256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_int256(add(headStart, offset), dataEnd)
        }

        {

            let offset := calldataload(add(headStart, 64))
            if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

            value2, value3 := abi_decode_t_bytes_calldata_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_string_memory_ptr_fromMemory(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

        {

            let offset := mload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

            value0 := abi_decode_t_string_memory_ptr_fromMemory(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_struct$_ExactInputParams_$2879_memory_ptr(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

            value0 := abi_decode_t_struct$_ExactInputParams_$2879_memory_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_struct$_ExactInputSingleParams_$2860_calldata_ptr(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 256) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_struct$_ExactInputSingleParams_$2860_calldata_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_struct$_ExactOutputParams_$2923_calldata_ptr(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

            value0 := abi_decode_t_struct$_ExactOutputParams_$2923_calldata_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_struct$_ExactOutputSingleParams_$2904_calldata_ptr(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 256) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_struct$_ExactOutputSingleParams_$2904_calldata_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_struct$_SwapCallbackData_$1394_memory_ptr(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert(0, 0) }

            value0 := abi_decode_t_struct$_SwapCallbackData_$1394_memory_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_uint160(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_uint160(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_uint24(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_uint24(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_uint256t_address(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_uint256t_addresst_uint256t_address(headStart, dataEnd) -> value0, value1, value2, value3 {
        if slt(sub(dataEnd, headStart), 128) { revert(0, 0) }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 96

            value3 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function abi_encodeUpdatedPos_t_bytes_memory_ptr_to_t_bytes_memory_ptr(value0, pos) -> updatedPos {
        updatedPos := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr(value0, pos)
    }

    function abi_encode_t_address_to_t_address(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encode_t_address_to_t_address_fromStack(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function abi_encode_t_address_to_t_address_nonPadded_inplace_fromStack(value, pos) {
        mstore(pos, leftAlign_t_address(cleanup_t_address(value)))
    }

    // bytes[] -> bytes[]
    function abi_encode_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr_to_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr_fromStack(value, pos)  -> end  {
        let length := array_length_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr_fromStack(pos, length)
        let headStart := pos
        let tail := add(pos, mul(length, 0x20))
        let baseRef := array_dataslot_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr(value)
        let srcPtr := baseRef
        for { let i := 0 } lt(i, length) { i := add(i, 1) }
        {
            mstore(pos, sub(tail, headStart))
            let elementValue0 := mload(srcPtr)
            tail := abi_encodeUpdatedPos_t_bytes_memory_ptr_to_t_bytes_memory_ptr(elementValue0, tail)
            srcPtr := array_nextElement_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr(srcPtr)
            pos := add(pos, 0x20)
        }
        pos := tail
        end := pos
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    // bytes -> bytes
    function abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(start, length, pos) -> end {
        pos := array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length)

        copy_calldata_to_memory(start, pos, length)
        end := add(pos, length)
    }

    function abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr(value, pos) -> end {
        let length := array_length_t_bytes_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_bytes_memory_ptr(pos, length)
        copy_memory_to_memory(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value, pos) -> end {
        let length := array_length_t_bytes_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, length)
        copy_memory_to_memory(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_t_int256_to_t_int256_fromStack(value, pos) {
        mstore(pos, cleanup_t_int256(value))
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
        copy_memory_to_memory(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_t_stringliteral_a5c1362ddf12293b907d8907d79f16e40792a7ddc4f09ee6d70cfec4ad443305_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 18)

        mstore(add(pos, 0), "Too much requested")

        end := add(pos, 32)
    }

    function abi_encode_t_stringliteral_f037a9cbca9be03859489f289f0cf5f85c0414bbfdd9785bc7ab31bd734e249c_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 19)

        mstore(add(pos, 0), "Too little received")

        end := add(pos, 32)
    }

    // struct SwapRouter.SwapCallbackData -> struct SwapRouter.SwapCallbackData
    function abi_encode_t_struct$_SwapCallbackData_$1394_memory_ptr_to_t_struct$_SwapCallbackData_$1394_memory_ptr_fromStack(value, pos)  -> end  {
        let tail := add(pos, 0x40)

        {
            // path

            let memberValue0 := mload(add(value, 0x00))

            mstore(add(pos, 0x00), sub(tail, pos))
            tail := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr(memberValue0, tail)

        }

        {
            // payer

            let memberValue0 := mload(add(value, 0x20))
            abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x20))
        }

        end := tail
    }

    function abi_encode_t_uint160_to_t_uint160_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint160(value))
    }

    function abi_encode_t_uint24_to_t_uint24_nonPadded_inplace_fromStack(value, pos) {
        mstore(pos, leftAlign_t_uint24(cleanup_t_uint24(value)))
    }

    function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encode_tuple_packed_t_address_t_uint24_t_address__to_t_address_t_uint24_t_address__nonPadded_inplace_fromStack_reversed(pos , value2, value1, value0) -> end {

        abi_encode_t_address_to_t_address_nonPadded_inplace_fromStack(value0,  pos)
        pos := add(pos, 20)

        abi_encode_t_uint24_to_t_uint24_nonPadded_inplace_fromStack(value1,  pos)
        pos := add(pos, 3)

        abi_encode_t_address_to_t_address_nonPadded_inplace_fromStack(value2,  pos)
        pos := add(pos, 20)

        end := pos
    }

    function abi_encode_tuple_packed_t_bytes_calldata_ptr__to_t_bytes_memory_ptr__nonPadded_inplace_fromStack_reversed(pos , value1, value0) -> end {

        pos := abi_encode_t_bytes_calldata_ptr_to_t_bytes_memory_ptr_nonPadded_inplace_fromStack(value0, value1,  pos)

        end := pos
    }

    function abi_encode_tuple_t_address__to_t_address__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

    }

    function abi_encode_tuple_t_address_t_bool_t_int256_t_uint160_t_bytes_memory_ptr__to_t_address_t_bool_t_int256_t_uint160_t_bytes_memory_ptr__fromStack_reversed(headStart , value4, value3, value2, value1, value0) -> tail {
        tail := add(headStart, 160)

        abi_encode_t_address_to_t_address_fromStack(value0,  add(headStart, 0))

        abi_encode_t_bool_to_t_bool_fromStack(value1,  add(headStart, 32))

        abi_encode_t_int256_to_t_int256_fromStack(value2,  add(headStart, 64))

        abi_encode_t_uint160_to_t_uint160_fromStack(value3,  add(headStart, 96))

        mstore(add(headStart, 128), sub(tail, headStart))
        tail := abi_encode_t_bytes_memory_ptr_to_t_bytes_memory_ptr_fromStack(value4,  tail)

    }

    function abi_encode_tuple_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr__to_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr_to_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr_fromStack(value0,  tail)

    }

    function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

    }

    function abi_encode_tuple_t_stringliteral_a5c1362ddf12293b907d8907d79f16e40792a7ddc4f09ee6d70cfec4ad443305__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_a5c1362ddf12293b907d8907d79f16e40792a7ddc4f09ee6d70cfec4ad443305_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_tuple_t_stringliteral_f037a9cbca9be03859489f289f0cf5f85c0414bbfdd9785bc7ab31bd734e249c__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_f037a9cbca9be03859489f289f0cf5f85c0414bbfdd9785bc7ab31bd734e249c_to_t_string_memory_ptr_fromStack( tail)

    }

    function abi_encode_tuple_t_struct$_SwapCallbackData_$1394_memory_ptr__to_t_struct$_SwapCallbackData_$1394_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_struct$_SwapCallbackData_$1394_memory_ptr_to_t_struct$_SwapCallbackData_$1394_memory_ptr_fromStack(value0,  tail)

    }

    function abi_encode_tuple_t_uint256__to_t_uint256__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

    }

    function access_calldata_tail_t_bytes_calldata_ptr(base_ref, ptr_to_tail) -> addr, length {
        let rel_offset_of_tail := calldataload(ptr_to_tail)
        if iszero(slt(rel_offset_of_tail, sub(sub(calldatasize(), base_ref), sub(0x20, 1)))) { revert(0, 0) }
        addr := add(base_ref, rel_offset_of_tail)

        length := calldataload(addr)
        if gt(length, 0xffffffffffffffff) { revert(0, 0) }
        addr := add(addr, 32)
        if sgt(addr, sub(calldatasize(), mul(length, 0x01))) { revert(0, 0) }

    }

    function allocateMemory(size) -> memPtr {
        memPtr := mload(64)
        let newFreePtr := add(memPtr, size)
        // protect against overflow
        if or(gt(newFreePtr, 0xffffffffffffffff), lt(newFreePtr, memPtr)) { panic_error() }
        mstore(64, newFreePtr)
    }

    function array_allocation_size_t_bytes_memory_ptr(length) -> size {
        // Make sure we can allocate memory without overflow
        if gt(length, 0xffffffffffffffff) { panic_error() }

        // round up
        size := and(add(length, 0x1f), not(0x1f))

        // add length slot
        size := add(size, 0x20)

    }

    function array_allocation_size_t_string_memory_ptr(length) -> size {
        // Make sure we can allocate memory without overflow
        if gt(length, 0xffffffffffffffff) { panic_error() }

        // round up
        size := and(add(length, 0x1f), not(0x1f))

        // add length slot
        size := add(size, 0x20)

    }

    function array_dataslot_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr(ptr) -> data {
        data := ptr

        data := add(ptr, 0x20)

    }

    function array_length_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_length_t_bytes_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_length_t_string_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_nextElement_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr(ptr) -> next {
        next := add(ptr, 0x20)
    }

    function array_storeLengthForEncoding_t_array$_t_bytes_memory_ptr_$dyn_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function array_storeLengthForEncoding_t_bytes_memory_ptr(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function array_storeLengthForEncoding_t_bytes_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function array_storeLengthForEncoding_t_bytes_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
        updated_pos := pos
    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function cleanup_t_bytes32(value) -> cleaned {
        cleaned := value
    }

    function cleanup_t_int256(value) -> cleaned {
        cleaned := value
    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_uint24(value) -> cleaned {
        cleaned := and(value, 0xffffff)
    }

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function cleanup_t_uint8(value) -> cleaned {
        cleaned := and(value, 0xff)
    }

    function copy_calldata_to_memory(src, dst, length) {
        calldatacopy(dst, src, length)
        // clear end
        mstore(add(dst, length), 0)
    }

    function copy_memory_to_memory(src, dst, length) {
        let i := 0
        for { } lt(i, length) { i := add(i, 32) }
        {
            mstore(add(dst, i), mload(add(src, i)))
        }
        if gt(i, length)
        {
            // clear end
            mstore(add(dst, length), 0)
        }
    }

    function leftAlign_t_address(value) -> aligned {
        aligned := leftAlign_t_uint160(value)
    }

    function leftAlign_t_uint160(value) -> aligned {
        aligned := shift_left_96(value)
    }

    function leftAlign_t_uint24(value) -> aligned {
        aligned := shift_left_232(value)
    }

    function panic_error() {
        invalid()
    }

    function round_up_to_mul_of_32(value) -> result {
        result := and(add(value, 31), not(31))
    }

    function shift_left_232(value) -> newValue {
        newValue :=

        shl(232, value)

    }

    function shift_left_96(value) -> newValue {
        newValue :=

        shl(96, value)

    }

    function validator_revert_t_address(value) {
        if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
    }

    function validator_revert_t_bytes32(value) {
        if iszero(eq(value, cleanup_t_bytes32(value))) { revert(0, 0) }
    }

    function validator_revert_t_int256(value) {
        if iszero(eq(value, cleanup_t_int256(value))) { revert(0, 0) }
    }

    function validator_revert_t_uint160(value) {
        if iszero(eq(value, cleanup_t_uint160(value))) { revert(0, 0) }
    }

    function validator_revert_t_uint24(value) {
        if iszero(eq(value, cleanup_t_uint24(value))) { revert(0, 0) }
    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

    function validator_revert_t_uint8(value) {
        if iszero(eq(value, cleanup_t_uint8(value))) { revert(0, 0) }
    }

}
