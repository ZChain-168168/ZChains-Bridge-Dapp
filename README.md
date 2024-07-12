# GoerBridge-solidity

GoerBridge uses Solidity smart contracts to enable transfers to and from EVM compatible chains. These contracts consist of a core bridge contract (Bridge.sol) and a set of handler contracts (ERC20Handler.sol, ERC721Handler.sol, and GenericHandler.sol). The bridge contract is responsible for initiating, voting on, and executing proposed transfers. The handlers are used by the bridge contract to interact with other existing contracts.

Read more [here]().

A CLI to deploy and interact with these contracts can be found [here](https://github.com/tdkhoa2002/bridge-evm).

## Requirements
requires:   `// SPDX-License-Identifier: MIT` and `compiler 0.8.18`.

# Deploy Essential Contracts
- Step 1: Deploy contract Bridge
- Step 2: Deploy contract Factory (Input: contract bridge deployed)
- Step 3: Use function deployedBridge to deploy Bridge to Factory (input contract origin is contract bridge at step 1)
- Step 4: Go to explorer, type transaction hash in step 3 and go to logs to see new contract bridge
- Step 5: Go to new contract bridge create blockchains and finish.

# Configuration
## Bridge
- Project ID: 664eeb4c896e7bbfd4cc1988
- Currency: USDZ

 | | ZChain | Ethereum |
 |---|---|---|
 | Factory Contract | 0xCaBB303ebc4d61023CC4a4dd994025C492B075f9 | 0x10aCB3Dc7E4996a4aBED3F978B65B3c4Ac44b0D1 |
 | Bridge Origin Contract | 0x14fCce53de28bc9D87937a944EB02e7177E78ec9 | 0x9710230642a455e2cfaa6d2ebb0d8d62de9ba054 |
 | Bridge Contract | 0xa55E39B3127F4648f5b8f5F7F20F8a0a702938EE | 0xf6a9ed9844b4eabd13854a6d37ee845e30dff773 |
 | USDT | 0x818a65d080EfE45881DBC8f95f4184B9EF3582fD | 0xdac17f958d2ee523a2206206994597c13d831ec7 |
 | Deployer | 0xE11fce0B4b2AB0635Ae6d0cbB0b62e33F4a80924 | 0xE11fce0B4b2AB0635Ae6d0cbB0b62e33F4a80924 |
 | Monitor | 0xE11fce0B4b2AB0635Ae6d0cbB0b62e33F4a80924 | 0xE11fce0B4b2AB0635Ae6d0cbB0b62e33F4a80924 |
 | Fee Native | 10 ZCD | 0.0005 ETH |
 | Fee Token | 0.1% | 0% |
 | Min | 5 | 5 |
 | Allow to Chain | ETH | ZCHAINS |
 | Allow from Chain | ETH | ZCHAINS |
 | Subgraph | https://graphnode.evmbuilder.com/subgraphs/name/zchainbridge/graphql | https://api.studio.thegraph.com/query/81750/zchainbridge/version/latest |


### Bridge fee

- FEE_NATIVE by native token
- Percentage Fee by token

### Change Monitor Address

### Change Owner

User only use function receive tokens to bridge token from blockchain A to blockchain B
