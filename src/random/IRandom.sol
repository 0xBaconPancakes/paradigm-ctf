// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IRandom {
    function solved() external view returns (bool);

    function solve(uint256 input) external;
}