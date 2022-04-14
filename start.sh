#!/usr/bin/env bash
DATA_DIR="./blockchain"
CONFIG_DIR="./blockchain/config"
EOS_PUB_KEY= #REPLACE THIS WITH ITS CORRESPONDING VALUE
EOS_PRIV_KEY= #REPLACE THIS WITH ITS CORRESPONDING VALUE
echo "Running Node Again... \n";
set -ex;
ulimit -n 65535
ulimit -s 64000

if [ ! -d $CONFIG_DIR ]; then
  mkdir -p $CONFIG_DIR;
  cp ./config.ini $CONFIG_DIR/config.ini
fi

start_nodeos=$"nodeos \
  --config-dir $CONFIG_DIR \
  --data-dir $DATA_DIR/data \
  --blocks-dir $DATA_DIR/blocks \
  --disable-replay-opts \
  --access-control-allow-origin=* \
  --contracts-console \
  --http-validate-host=false \
  --verbose-http-errors \
  --signature-provider $SIGNING_PUB_KEY=KEY:$SIGNING_PRIV_KEY" ;

$start_nodeos & echo $! > $DATA_DIR/nodeos.pid
