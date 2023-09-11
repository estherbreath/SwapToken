import { ethers } from "hardhat";
// import { IBosslady__factory, IYourToken__factory } from "../typechain-types";

async function main() {

  const bossladyToken ="0x3c495b89Cd526279fADD8620177bCF8386428f23" 
  const yourToken = "0x50aee728897bb32B8fbf649cE2fc5f3cAec2Ed97"
  const swapToken = "0x6FBa7BA1e4b5fbABb6C4cd1D522AEAF53d90E024"
  const signer = "0x77aC3a62c12333DD9604f8D5cD6E350Cd33D04b4"

    const swap = await ethers.getContractAt('ISwap', swapToken)
    let bToken = await ethers.getContractAt("IBosslady",  bossladyToken)
    let yToken = await ethers.getContractAt("IYourToken", yourToken)

    const impersonatedSigner = await ethers.getImpersonatedSigner(signer)
    const approveBossladyToken = await ethers.parseEther("1000")
    const approveYourToken = await ethers.parseEther("5000")

    await bToken.connect(impersonatedSigner).approve(swap, approveBossladyToken)
    await yToken.connect(impersonatedSigner).approve(swap, approveYourToken)

    const swapA = ethers.parseEther("500")
    const swapB = ethers.parseEther("1500")

    await swap.connect(impersonatedSigner).addLiquidity(swapA, swapB)
    console.log("liquidity added")

  }
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });