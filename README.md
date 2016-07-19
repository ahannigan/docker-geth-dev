# docker-geth-dev

## Overview

This project runs [geth](https://github.com/ethereum/go-ethereum) in a container.

##### Info:

- For running a private ethereum network
- The node has 5 built in accounts with preallocated ether balances
- Mining blocks only when needed can be activated by setting `MINE_WHEN_NEEDED` environment variable to true (default when running with compose)
- All apis are exposed via RPC
- Chain data is stored in a volume in standard `docker-compose.yml`
- Geth nodes can be scaled and will automatically peer with each other using `docker-compose-scalable.yml` as volumes are not used.

**Note:** Stating the obvious - for **development** use only

## Running

- Run the bootnode and a single Geth node:
```bash
docker-compose up -d
```

- Geth nodes can be scaled and automatically peer'd with each other using `docker-compose-scalable.yml`
```bash
docker-compose -f docker-compose-scalable.yml up -d
docker-compose -f docker-compose-scalable.yml scale geth=3
```
_Note_: when using the scalable version, you will have to run `docker ps` to get the exposed RPC port for each container as they will be random rather than `8545`.  - In the scalable compose data is also not stored in external volumes - removing containers means you lose your chain.
