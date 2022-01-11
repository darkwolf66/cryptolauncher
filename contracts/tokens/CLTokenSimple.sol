//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CLTokenSimple is ERC20 {
    constructor(string memory name, string memory symbol, uint256 totalSupply, address owner) ERC20(name, symbol) {
        _mint(owner, totalSupply * 10 ** decimals());
    }
}