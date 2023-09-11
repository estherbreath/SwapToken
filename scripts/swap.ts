import { ethers } from "hardhat";


async function main() {
  const BossladyToken = "0x8Ec601e4410891CB2f2abF7c7031B0a3e84869eC"
  const yourtoken = "0x76202af4a9d5a30198665786c15e4feEc2b2451D"

    const swap = await ethers.deployContract("TokenSwapper", [BossladyToken, yourtoken] );
  
   
    await swap.waitForDeployment()
  
  
    console.log('TokenSwapper contract deployed to:', swap.target);
  }

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });

  //0x95d1FA946BD7655bAcD20F484a0E90C01769E582