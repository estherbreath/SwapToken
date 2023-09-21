// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BossladyToken is ERC20{
      constructor() ERC20("Bosslady", "BLT"){
      _mint(msg.sender, 1000000e18);
      }
}