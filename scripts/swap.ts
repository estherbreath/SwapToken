import { ethers } from "hardhat";


async function main() {

    const swap = await ethers.deployContract("TokenSwapper", ["0x6f65F28b9B4A1D23662523838DD1377004028443", "0x50aee728897bb32B8fbf649cE2fc5f3cAec2Ed97"] );
  
   
    await swap.waitForDeployment()
  
  
    console.log('TokenSwapper contract deployed to:', swap.target);
  }

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });

  //0x95d1FA946BD7655bAcD20F484a0E90C01769E582