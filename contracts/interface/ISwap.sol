
// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;


interface ISwap {
    function swapToB(uint256 amountA) external;
    function swapToA(uint256 amountB) external;
    
}