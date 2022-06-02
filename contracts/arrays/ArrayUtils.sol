// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

library ArrayUtils {
    function contains(bytes32[] calldata array, bytes32 value) public pure returns(bool) {
        for(uint i = 0; i < array.length; i++) {
            if(array[i] == value) {
                return true;
            }
        }

        return false;
    }

    function contains(address[] calldata array, address value) public pure returns(bool) {
        for(uint i = 0; i < array.length; i++) {
            if(array[i] == value) {
                return true;
            }
        }

        return false;
    }

    function removeAt(bytes32[] storage array, uint elementAt) public {
        require(elementAt >= 0);
        require(elementAt < array.length);

        array[elementAt] = array[array.length - 1];
        array.pop();
    }

    function removeAt(address[] storage array, uint elementAt) public {
        require(elementAt >= 0);
        require(elementAt < array.length);

        array[elementAt] = array[array.length - 1];
        array.pop();
    }

    function removeAtKeepOrder(bytes32[] storage array, uint elementAt) public {
        require(elementAt >= 0);
        require(elementAt < array.length);

        for(uint i = elementAt; i < array.length-1; i++){
            array[i] = array[i+1];      
        }

        array.pop();
    }

    function removeSingleElement(bytes32[] storage array, bytes32 value) public {
        for(uint i = 0; i < array.length;) {
            if(array[i] == value) {
                removeAt(array, i);
                return;
            }

            i++;
        }
    }

    function removeSingleElement(address[] storage array, address value) public {
        for(uint i = 0; i < array.length;) {
            if(array[i] == value) {
                removeAt(array, i);
                return;
            }

            i++;
        }
    }
}