./geth --datadir node init genesis.json
./geth --config ./config.toml --datadir ./node  --cache 18000 --rpc.allow-unprotected-txs --txlookuplimit 0 --ws --http