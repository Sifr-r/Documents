# Solidity

Smart contract language for Ethereum and EVM-compatible blockchains.

## Topics

| File | Description |
|---|---|
| [core.md](core.md) | Types, modifiers, events, inheritance, gas optimization |

## Quick Reference

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract
contract Counter {
    uint256 private count;
    address public owner;

    // Events
    event Incremented(uint256 newValue);

    // Modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function increment() external onlyOwner {
        count++;
        emit Incremented(count);
    }

    function getCount() external view returns (uint256) {
        return count;
    }
}
```