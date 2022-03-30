# DApp Tools
- [geth - official docs](https://geth.ethereum.org/docs/)

## geth 
1. installation
- [run inside docker container](https://geth.ethereum.org/docs/install-and-build/installing-geth#run-inside-docker-container)
```bash
docker run -it --name=geth-tools-01 --network=dapp-net -p 30303:30303 -v ~/docker_data/geth_data:/root/.ethereum ethereum/client-go:alltools-latest  
```
> `dapp-net` network be created previously via `docker network create dapp-net`

2. usage
- [using with private network](https://geth.ethereum.org/docs/interface/private-network)
```bash
## Create account
geth account new --datadir data

## create private chain net with genesis
geth init --datadir data genesis.json
```
`genesis.json`
```json
{
  "config": {
    "chainId": 15,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "ethash": {}
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "alloc": {
    "7df9a875a174b3bc565e6424a0050ebc1b2d1d82": { "balance": "300000" },
    "f41c74c9ae680c1aa78f42e5647a62f353b7bdde": { "balance": "400000" }
  }
}
```