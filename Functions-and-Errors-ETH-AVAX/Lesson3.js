const { ethers } = require("hardhat");

async function main() {
  const Lesson3 = await ethers.getContractFactory("Lesson3");
  
  const lesson3 = await Lesson3.deploy();
  await lesson3.deployed();
  console.log("Lesson3 deployed to:", lesson3.address);

  const [sender, receiver] = await ethers.getSigners();

  await lesson3.Deposit(receiver.address, 100);
  console.log("Deposited 100 tokens to receiver");

  await lesson3.Withdraw(sender.address, 50);
  console.log("Withdrawn 50 tokens from sender");

  await lesson3.Transfer(sender.address, receiver.address, 30);
  console.log("Transferred 30 tokens from sender to receiver");

  const receiverBalance = await lesson3.getBalance(receiver.address);
  console.log("Receiver balance:", receiverBalance.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
