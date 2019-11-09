module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // Match Ganache IP
      port: 7545, // Match Ganache PORT
      network_id: "*" // Match any network id
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  }
}
