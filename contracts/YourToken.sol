// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YourToken is ERC20{
    
       constructor() ERC20("YourToken", "YTS"){
      _mint(msg.sender, 5000e18);

      }
}

