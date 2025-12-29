// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ILazarusVault {
    event HeartbeatSent(uint256 timestamp);
    event VaultExecuted(address indexed beneficiary, uint256 amount);

    function ping() external;
    function execute() external;
    function getRemainingTime() external view returns (uint256);
}