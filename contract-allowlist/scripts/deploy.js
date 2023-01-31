const { ethers } = require("hardhat");

async function main() {

  const allowlistContract = await ethers.getContractFactory("Allowlist");

  // Deploy the contract, and cap the allowlisted addresses to max n
  const deployedAllowlistContract = await allowlistContract.deploy(25);

  // Let's do a little waiting
  await deployedAllowlistContract.deployed();

  // Log the address of our contract!
  console.log("Allowlist Contract Address:", deployedAllowlistContract.address);
}

// Check for errors after running our main function
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
