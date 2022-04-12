#!/usr/bin/env bash
DATA_DIR="./blockchain"
CONFIG_DIR="./blockchain/config"
EOS_PUB_KEY=VEX7Lmu76HHMYeKrA7wQ5JWsT2RJktHo6KDbNE27PTLUo1qXWz3pv  #REPLACE THIS WITH ITS CORRESPONDING VALUE
EOS_PRIV_KEY=5JW2qXzQB5xpd36k9EhKSVJDdf8k53hq26cJ6EiZuN6LjZQ1LMi #REPLACE THIS WITH ITS CORRESPONDING VALUE
echo "Starting Launch New Standby Node... \n";
set -ex;
ulimit -n 65535
ulimit -s 64000
mkdir -p $CONFIG_DIR
cp ./config.ini $CONFIG_DIR/config.ini
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
