require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  etherscan: {
    apiKey: "api_key",
  },
  networks : {
    goerli : {
      url : "https://rpc.ankr.com/eth_goerli",
      accounts : ['prvt_key'],
    },
    sepolia : {
      url : "https://sepolia.infura.io/v3/apikey",
      accounts : ['prvt_key'],
    },
  }
};
