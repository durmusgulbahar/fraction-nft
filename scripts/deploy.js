// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  const metadata_url = "https://nftmarket2.infura-ipfs.io/ipfs/QmV1naQoEQFqZeZfzBPC3gZSZV1ReaevYMBj3snBW2zgiT";
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const creator = await hre.ethers.getContractFactory("NFTCreator")
  const creatorContract = await creator.deploy("ArsaNFT","ART",metadata_url,1000);
  await creatorContract.deployed();
  //owner name symbol exit price
  console.log("deployed to:", creatorContract.address)
  
  const owner = await creatorContract.getItemOwner(0);
  const name = await creatorContract.getItemName(0);
  const symbol = await creatorContract.getItemSymbol(0);
  const exitPrice = await creatorContract.getItemExitPrice(0);
  const sharePrice = await creatorContract.getItemSharePrice(0);
  const tokenURI = await creatorContract.tokenURI(0);
  

  console.log(owner,name,symbol,exitPrice,sharePrice,tokenURI);


}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
