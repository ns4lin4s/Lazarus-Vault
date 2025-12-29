// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./interfaces/ILazarusVault.sol";
import "./libraries/Constants.sol";

contract LazarusVault is ILazarusVault {

    address public immutable owner;
    address public beneficiary;
    uint256 public immutable heartbeatInterval;
    uint256 public lastHeartbeat;

    modifier onlyOwner() {
        if (msg.sender != owner) revert VaultErrors.NotOwner();
        _;
    }

    constructor(address _beneficiary, uint256 _interval) payable {
        owner = msg.sender;
        beneficiary = _beneficiary;
        heartbeatInterval = _interval;
        lastHeartbeat = block.timestamp;
    }

    function ping() external override onlyOwner {
        lastHeartbeat = block.timestamp;
        emit HeartbeatSent(block.timestamp);
    }

    function getRemainingTime() public view override returns (uint256) {
        uint256 expirationTime = lastHeartbeat + heartbeatInterval;
        if (block.timestamp >= expirationTime) {
            return 0;
        }
        return expirationTime - block.timestamp;
    }

    function execute() external override {
        // Por implementar...
    }

    receive() external payable {}

}