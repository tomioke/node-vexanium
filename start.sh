#!/usr/bin/env bash
echo "Starting Node Latest Data... \n";
set -ex;
ulimit -n 65535
ulimit -s 64000

DATA_DIR="blockchain";
CONFIG_DIR="./blockchain/config";
SIGNING_PUB_KEY="VEX7Lmu76HHMYeKrA7wQ5JWsT2RJktHo6KDbNE27PTLUo1qXWz3pv" # Insert your public key here
SIGNING_PRIV_KEY="5JW2qXzQB5xpd36k9EhKSVJDdf8k53hq26cJ6EiZuN6LjZQ1LMi" # Insert your private key here

mkdir -p $CONFIG_DIR
cp ./config.ini $CONFIG_DIR/config.ini

start_nodeos=$"nodeos \
  --config-dir $CONFIG_DIR \
  --data-dir $DATA_DIR/data \
  --blocks-dir $DATA_DIR/blocks \
  --replay-blockchain \
  --hard-replay-blockchain \
  --disable-replay-opts \
  --signature-provider $SIGNING_PUB_KEY=KEY:$SIGNING_PRIV_KEY" ;

$start_nodeos & echo $! > $DATA_DIR/nodeos.pid
