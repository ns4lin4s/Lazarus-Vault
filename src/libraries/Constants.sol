// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library VaultErrors {
    error NotOwner();
    error NotBeneficiary();
    error StillAlive(uint256 timeRemaining);
    error ExecutionFailed();
}