// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface ISetupRandom {
    function random() external returns (address);

    function isSolved() external returns (bool);
}