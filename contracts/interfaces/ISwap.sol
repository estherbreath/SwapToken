
// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;


interface ISwap {
    function addLiquidity(uint256 _amountA, uint256 _amountB) external;
    function removeLiquidity(uint _amountA, uint _amountB) external;
    function swapToB(uint256 amountA) external;
    function swapToA(uint256 amountB) external;
    
}