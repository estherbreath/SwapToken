import { ethers } from "hardhat";
// import { IBosslady__factory, IYourToken__factory } from "../typechain-types";

async function main() {
const [signer1] = await ethers.getSigners()
  const bossladyToken ="0xC98ab3927Ff418E4CD5BdDaFA57a0CD406da8fd3" 
  const yourToken = "0xdA339a52964BE248624db317768fe3c97D3BDEb8"
  const swapToken = "0x2adc00a570b887c80bB1A97EC42c5cd1E5199125"
  const signer = "0x77aC3a62c12333DD9604f8D5cD6E350Cd33D04b4"

    const swap = await ethers.getContractAt('ISwap', swapToken)

    let bToken = await ethers.getContractAt("IERC20",  bossladyToken)
    let yToken = await ethers.getContractAt("IERC20", yourToken)

    const impersonatedSigner = await ethers.getImpersonatedSigner(signer)
    const approveBossladyToken = ethers.parseEther("500")
    const approveYourToken = ethers.parseEther("500")

    const approveA = await bToken.approve(swap, approveBossladyToken)
    const approveB = await yToken.approve(swap, approveYourToken)

    await approveA.wait()
    await approveB.wait()

    // const allowanceA = await bToken.allowance(signer1.address, swapToken)
    // const allowanceB = await yToken.allowance(signer1.address, swapToken)

    // console.log(allowanceA,allowanceB)
    const liquidityA = ethers.parseEther("500")
    const liquidityB = ethers.parseEther("500")

    console.log(signer1.address)

    // const liquid = await swap.addLiquidity(liquidityA, liquidityB)

    // await liquid.wait()
    // console.log("liquidity added")

    const liquid = await swap.removeLiquidity(liquidityA, liquidityB)

    await liquid.wait()

    const allowanceA = await bToken.allowance("0x77aC3a62c12333DD9604f8D5cD6E350Cd33D04b4", swap)
    const allowanceB = await yToken.allowance("0x77aC3a62c12333DD9604f8D5cD6E350Cd33D04b4", swap)

    console.log(allowanceA,allowanceB)

    const swapB = await swap.swapToB(ethers.parseEther("100"));
    await swapB.wait();

  }
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });