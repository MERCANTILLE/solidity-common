// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ArrayUtils.sol";

contract StringHashArray {
    struct ArrayData{
        mapping(bytes32 => bool) contains;
        bytes32[] array;
    }

    ArrayData data;

    function add(bytes32 value) external returns (bool) {
        if(data.contains[value]) {
            return false;
        }

        data.contains[value] = true;
        data.array.push(value);

        return true;
    }

    function remove(bytes32 value) external returns (bool) {
        if(!data.contains[value]) {
            return false;
        }

        delete data.contains[value];
        ArrayUtils.removeSingleElement(data.array, value);
        return true;
    }

    function clear() external {
        for(uint i = 0; i < data.array.length; i++)
        {
            delete data.contains[data.array[i]];
        }

        delete data.array;
    }
}