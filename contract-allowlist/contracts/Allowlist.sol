//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Allowlist {
    
    // Hold the maximum number of allowlisted addresses
    uint8 public maxAllowlistedAddresses;

    // Do a little mapping with true/false values for the addresses
    mapping(address => bool) public allowlistedAddresses;

    // So how many allowlisted addresses do we actually have?
    uint public numAllowlistedAddresses;

    // Set out max allowlisted addresses later on
    constructor(uint8 _maxAllowlistedAddresses) {
        maxAllowlistedAddresses = _maxAllowlistedAddresses;
    }

    // Our actual allowlist address addor function!
    function addAllowlistedAddress() public {
        // Form two requires, to enable error/debug messages to help out with context.
        require(!allowlistedAddresses[msg.sender], "You're already allowlisted!");
        require(numAllowlistedAddresses < maxAllowlistedAddresses, "The allow list is full, sorry!");
        // Set the allowlist address
        allowlistedAddresses[msg.sender] = true;
        // Update our counter by +1
        numAllowlistedAddresses += 1;
    }
}