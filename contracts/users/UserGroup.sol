// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "./../arrays/ArrayUtils.sol";

contract UserGroup {
    address[] private usersInGroup;

    function getUsers() public view returns (address[] memory) {
        return usersInGroup;
    }

    function addUser(address user) public {
        if(checkUserInGroup(user)) {
            return;
        }

        usersInGroup.push(user);
    }

    function removeUser(address user) public {
        ArrayUtils.removeSingleElement(usersInGroup, user);
    }

    function checkUserInGroup(address user) public view returns (bool) {
        for(uint i = 0; i < usersInGroup.length; i++) {
            if (usersInGroup[i] == user) {
                return true;
            }
        }

        return false;
    }
}