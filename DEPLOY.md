# Custom Deploy

## Configuration

The project contains a `config` folder, where each network's configuration is stored. Each configuration file follows this structure:

```json
{
  "network": "bob-testnet",
  "node": {
    "address": "RCP_URL",
    "log_level": "debug"
  },
  "PoolAddressesProviderRegistry": {
    "address": "",
    "startBlock": 0
  },
  "AaveOracle": {
    "address": "",
    "startBlock": 0
  },
  "RewardsController": {
    "address": "",
    "startBlock": 0
  }
}
```

- `network`: Network identifier used by The Graph (e.g., "bob-testnet")
- `PoolAddressesProviderRegistry`: 
  - address: Address of the Pool Addresses Provider Registry
  - startBlock: Block number from which to start indexing
- `AaveOracle`:
  - address: of the Aave Oracle contract
  - startBlock: Block number from which to start indexing
- `RewardsController`:
  - address: Address of the Rewards Controller. In the deployment folder, it is called `IncentivesV2-Implementation.json`.
  - startBlock: Block number from which to start indexing

Ensure to fill in the necessary addresses and block numbers for each network. The block number should correspond to the block in which the deployment was done to optimize load and avoid losing any events.
It is also important to add the rpc to the config file.

## Development

Before deploying it is crucial to be logged to thegraph.

```bash

# copy env and adjust its content with your personal access token and subgraph name

# you can get an access token from https://thegraph.com/explorer/dashboard
cp .env.test .env

# install project dependencies
npm i

# Run script to deploy it on testnet or mainnet. i.e. testnet script:
sh ./scripts/prepare_testnet.sh
```
