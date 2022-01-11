//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CLMintableBurnableToken is ERC20, ERC20Burnable, Ownable {
    constructor(string memory name, string memory symbol, uint256 totalSupply, address owner) ERC20(name, symbol) {
        _transferOwnership(owner);
        _mint(owner, totalSupply * 10 ** 18);
    }
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}