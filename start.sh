#!/usr/bin/env bash
echo "Starting Node Latest Data... \n";
set -ex;
ulimit -n 65535
ulimit -s 64000

DATA_DIR="blockchain";

SIGNING_PUB_KEY="VEX7Lmu76HHMYeKrA7wQ5JWsT2RJktHo6KDbNE27PTLUo1qXWz3pv" # Insert your public key here
SIGNING_PRIV_KEY="5JW2qXzQB5xpd36k9EhKSVJDdf8k53hq26cJ6EiZuN6LjZQ1LMi" # Insert your private key here

if [ ! -d $DATA_DIR ]; then
  mkdir -p $DATA_DIR;
fi

start_nodeos=$"nodeos \
  --config-dir $DATA_DIR/config \
  --data-dir $DATA_DIR/data \
  --blocks-dir $DATA_DIR/blocks \
  --disable-replay-opts \
  --access-control-allow-origin=* \
  --contracts-console \
  --http-validate-host=false \
  --verbose-http-errors \
  --signature-provider $SIGNING_PUB_KEY=KEY:$SIGNING_PRIV_KEY" ;

$start_nodeos & echo $! > $DATA_DIR/nodeos.pid
