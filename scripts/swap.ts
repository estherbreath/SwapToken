import { ethers } from "hardhat";


async function main() {
  const bossladyToken ="0xC98ab3927Ff418E4CD5BdDaFA57a0CD406da8fd3" 
  const yourToken = "0xdA339a52964BE248624db317768fe3c97D3BDEb8"
    const swap = await ethers.deployContract("TokenSwapper", [bossladyToken, yourToken] );
  
   
    await swap.waitForDeployment()
  
  
    console.log('TokenSwapper contract deployed to:', swap.target);
  }

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });

  //0xf1e1DFf97a0C84aa0aC62Df8e04c207B379696A4

