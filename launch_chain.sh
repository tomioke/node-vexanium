#!/usr/bin/env bash
DATA_DIR="./blockchain"
CONFIG_DIR="./blockchain/config"
EOS_PUB_KEY= #REPLACE THIS WITH ITS CORRESPONDING VALUE
EOS_PRIV_KEY= #REPLACE THIS WITH ITS CORRESPONDING VALUE
echo "Starting launch first time Node... \n";
set -ex;
ulimit -n 65535
ulimit -s 64000

if [ ! -d $CONFIG_DIR ]; then
  mkdir -p $CONFIG_DIR;
  cp ./config.ini $CONFIG_DIR/config.ini
fi

pid=0;
nodeos=$"nodeos \
 --config-dir $CONFIG_DIR \
 --data-dir $DATA_DIR/data \
 --blocks-dir $DATA_DIR/blocks \
 --disable-replay-opts \
 --signature-provider $EOS_PUB_KEY=KEY:$EOS_PRIV_KEY \
 --genesis-json genesis.json \
  -e" ;

$nodeos & echo $i > $DATA_DIR/nodeos.pid
