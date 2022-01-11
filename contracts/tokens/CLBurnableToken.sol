//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract CLBurnableToken is ERC20, ERC20Burnable {
    constructor(string memory name, string memory symbol, uint256 totalSupply, address owner) ERC20(name, symbol) {
        _mint(owner, totalSupply * 10 ** 18);
    }
}