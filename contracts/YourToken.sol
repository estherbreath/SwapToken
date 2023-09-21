// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YourToken is ERC20{
       constructor() ERC20("YourToken", "YTS"){
      _mint(msg.sender, 5000000e18);

      }
}

