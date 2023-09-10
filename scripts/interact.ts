import { ethers } from "hardhat";

const amount2 = ethers.parseEther('0.01')


async function main() {

    const swap = await ethers.getContractAt('ISwap', '0x95d1FA946BD7655bAcD20F484a0E90C01769E582' )

    await swap.swapToB()

  }