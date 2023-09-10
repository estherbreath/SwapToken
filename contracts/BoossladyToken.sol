// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BossladyToken is ERC20{
      constructor() ERC20("BossladyToken", "BLT"){
      _mint(msg.sender, 1000e18);
      }
}

//0x6f65F28b9B4A1D23662523838DD1377004028443