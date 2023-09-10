
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./YourToken.sol"; // Import the contract for YourToken
import "./BoossladyToken.sol"; // Import the contract for BossladyToken

contract TokenSwapper {
    address public owner;
    BossladyToken public bossladyToken; // Token A
    YourToken public yourToken;         // Token B

    constructor(address _bossladyToken, address _yourToken) {
        owner = msg.sender;
        bossladyToken = BossladyToken(_bossladyToken);
        yourToken = YourToken(_yourToken);
    }

    function swapToB(uint256 amountA) external {
        uint256 balanceA = bossladyToken.balanceOf(msg.sender);
        require(amountA <= balanceA, "Insufficient balance of Token A");

        uint256 reserveA = bossladyToken.balanceOf(address(this));
        uint256 reserveB = yourToken.balanceOf(address(this));
        uint256 constantK = reserveA * reserveB;

        uint256 amountB = (constantK * amountA) / ((reserveA + amountA) * reserveB);
        require(amountB > 0, "Amount B must be greater than 0");

        bossladyToken.transferFrom(msg.sender, address(this), amountA);
        yourToken.transfer(msg.sender, amountB);
    }

    function swapToA(uint256 amountB) external {
        uint256 balanceB = yourToken.balanceOf(msg.sender);
        require(amountB <= balanceB, "Insufficient balance of Token B");

        uint256 reserveA = bossladyToken.balanceOf(address(this));
        uint256 reserveB = yourToken.balanceOf(address(this));
        uint256 constantK = reserveA * reserveB;

        uint256 amountA = (constantK * amountB) / ((reserveB + amountB) * reserveA);
        require(amountA > 0, "Amount A must be greater than 0");

        yourToken.transferFrom(msg.sender, address(this), amountB);
        bossladyToken.transfer(msg.sender, amountA);
    }
}