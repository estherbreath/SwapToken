import { ethers } from "hardhat";

async function main() {

    const boss = await ethers.deployContract('BossladyToken', []) 
    await boss.waitForDeployment()
    
    console.log(`This contract has been deployed to ${boss.target}`);

}



main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });