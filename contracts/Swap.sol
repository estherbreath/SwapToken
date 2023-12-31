// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenSwapper {
    address public owner;
    address bossladyToken; // Token A
    address yourToken; // Token B

    uint256 public reserveA;
    uint256 public reserveB;

    struct LiquidityProvider{
        uint amountA;
        uint amountB;
    }

    mapping(address => LiquidityProvider) liquidityProvider;

    constructor(address _bossladyToken, address _yourToken) {
        owner = msg.sender;
        bossladyToken = _bossladyToken;
        yourToken = _yourToken;
    }

    function addLiquidity(uint256 _amountA, uint256 _amountB) external{
        IERC20(bossladyToken).transferFrom(msg.sender, address(this), _amountA);
        IERC20(yourToken).transferFrom(msg.sender, address(this), _amountB);
        reserveA += _amountA;
        reserveB += _amountB;
        LiquidityProvider storage provider = liquidityProvider[msg.sender];
        provider.amountA += _amountA;
        provider.amountB += _amountB;

    }

    function removeLiquidity(uint _amountA, uint _amountB) external {
        require(reserveA >= _amountA, "token in liquidity not enough");
        require(reserveB >= _amountB, "token in liquidity not enough");

        IERC20(bossladyToken).transfer(msg.sender, _amountA);
        IERC20(yourToken).transfer(msg.sender, _amountB);

        reserveA -= _amountA;
        reserveB -= _amountB;

        liquidityProvider[msg.sender].amountA -= _amountA;
        liquidityProvider[msg.sender].amountB -= _amountB;
    }
    function swapToB(uint256 amountA) external {
        uint256 balanceA = IERC20(bossladyToken).balanceOf(msg.sender);
        require(amountA <= balanceA, "Insufficient balance of Token A");

        reserveA = IERC20(bossladyToken).balanceOf(address(this));
        reserveB = IERC20(yourToken).balanceOf(address(this));
        uint256 constantK = reserveA * reserveB;

        uint256 amountB = (constantK * amountA) / ((reserveA + amountA) * reserveB);
        require(amountB > 0, "Amount B must be greater than 0");

      IERC20(bossladyToken).transferFrom(msg.sender, address(this), amountA);
        IERC20(yourToken).transfer(msg.sender, amountB);
    }

    function swapToA(uint256 amountB) external {
        uint256 balanceB = IERC20(yourToken).balanceOf(msg.sender);
        require(amountB <= balanceB, "Insufficient balance of Token B");

        reserveA = IERC20(bossladyToken).balanceOf(address(this));
        reserveB = IERC20(yourToken).balanceOf(address(this));
        uint256 constantK = reserveA * reserveB;

        uint256 amountA = (constantK * amountB) / ((reserveB + amountB) * reserveA);
        require(amountA > 0, "Amount A must be greater than 0");

        IERC20(yourToken).transferFrom(msg.sender, address(this), amountB);
      IERC20(bossladyToken).transfer(msg.sender, amountA);
    }
}