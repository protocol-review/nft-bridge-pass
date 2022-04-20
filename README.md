# NFT Bridge Pass

## Table of Contents  
- [Introduction](#intro)
- [Script](#script)  
- [Set Up](#setup) 

<h2>
<a name="intro"/>
Introduction
</a>
</h2>

The `NFTBridgePass` is a simple implementation of an NFT minted on L1 as a fun way to incentivize bridging into L2. The idea came from a post written by [Denis on Mirror](https://d.mirror.xyz/Sjpxa2r_wxkQUGXUr8oO2PhBlyfIRgLBx2YevoXXwyY).

<h2>
<a name="script"/>
Script
</a>
</h2>

We wrote a script that creates a new instance of `NFTBridgePass` and mints an NFT while bridging to Optimism. You can run a script against the Kovan network with the following command:
```
forge run src/scripts/Contract.sol -vvvv --rpc-url ${_42}
```

<a name="setup"/>
Setup
</a>
</h2>

### Install Foundry
See the [Foudry Github](https://github.com/gakonst/foundry#installation) repo for installation.

### Set up remappings
```
forge remappings > remappings.txt
```

### Set up env
```
cp .env.example .env
```

Update `.env` to include all variables.

### Compile files
```
make build
```
