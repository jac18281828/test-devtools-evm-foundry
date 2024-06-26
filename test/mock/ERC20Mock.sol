// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { ERC20Burnable } from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract ERC20Mock is ERC20, ERC20Burnable {
    bool public paused = false;

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) { }

    function mint(address _to, uint256 _amount) public {
        _mint(_to, _amount);
    }

    function pause() external {
        paused = true;
    }

    function unpause() external {
        paused = false;
    }
}
