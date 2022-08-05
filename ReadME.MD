# BSC Full Node

Node Binary Version : Release v1.1.12

## Mainnet
```
ChainID=56
HTTP=http://127.0.0.1:8545
WS=ws://127.0.0.1:8546
```
## Testnet
```
ChainID=97
HTTP=http://127.0.0.1:8575
WS=ws://127.0.0.1:8576
```
## Config

```
download geth lastest version
	wget https://github.com/bnb-chain/bsc/releases/download/v1.1.12/geth_linux
	chmod a+x geth_linux
	cp geth_linux geth56
	cp geth_linux geth97
	mv geth56 /usr/bin
	mv geth97 /usr/bin
download geth lastest config file
	mkdir testnet
	mkdir mainnet
	cd mainnet
	wget https://github.com/bnb-chain/bsc/releases/download/v1.1.12/mainnet.zip
	unzip mainnet.zip
	open config.toml
	localhost -> 127.0.0.1
	ListenAddr = ":30311"
	cd ../testnet
	wget https://github.com/bnb-chain/bsc/releases/download/v1.1.12/testnet.zip
	unzip testnet.zip
	open config.toml
	localhost -> 127.0.0.1
	ListenAddr = ":30322"

./geth --datadir node init genesis.json
./geth --config ./config.toml --datadir ./node  --cache 18000 --rpc.allow-unprotected-txs --txlookuplimit 0 --ws --http

nano /lib/systemd/system/geth56.service
nano /lib/systemd/system/geth97.service
[Unit]
Description=BSC Testnet go client
After=syslog.target network.target

[Service]
User=geth
Group=geth
Environment=HOME=/work/blockchain-node/bsc/testnet/geth97
Type=simple
ExecStartPre=geth97 --datadir node init /work/blockchain-node/bsc/testnet/genesis.json
ExecStart=geth97 --config /work/blockchain-node/bsc/testnet/config.toml --datadir /work/blockchain-node/bsc/testnet/node  --cache 18000 --rpc.allow-unprotected-txs --txlookuplimit 0 --ws --http
KillMode=process
KillSignal=SIGINT
TimeoutStopSec=90
Restart=on-failure
RestartSec=10s

[Install]
WantedBy=multi-user.target

systemctl enable geth56
systemctl start geth56
systemctl enable geth97
systemctl start geth97
```