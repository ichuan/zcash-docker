# zcash-docker
Dockerfile for zcash


# Building

```bash
docker build -t zcash .
```

# Running

Customize config file `coin.conf` first.

```bash
# block dir
mkdir -p data/{blocks,params}

# first time, fetch params
docker run --rm -it -v `pwd`/data/params:/root/.zcash-params --entrypoint /opt/coin/bin/zcash-fetch-params zcash

# later and in the future, run zcashd
docker run --rm -itd --name zec -p 8232:8232 -v `pwd`/data/blocks:/opt/coin/data -v `pwd`/data/params:/root/.zcash-params -v `pwd`/coin.conf:/opt/coin/coin.conf zcash
```

# Using pre-built docker image

```bash
docker run --rm -itd --name zec -p 8232:8232 -v `pwd`/data/blocks:/opt/coin/data -v `pwd`/data/params:/root/.zcash-params -v `pwd`/coin.conf:/opt/coin/coin.conf mixhq/zcash
```
