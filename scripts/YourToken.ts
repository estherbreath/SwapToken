import { ethers } from "hardhat";

async function main() {

    const your = await ethers.deployContract('YourToken', []) 
    await your.waitForDeployment()
    
    console.log(`This contract has been deployed to ${your.target}`);

}


main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });

  //0x50aee728897bb32B8fbf649cE2fc5f3cAec2Ed97