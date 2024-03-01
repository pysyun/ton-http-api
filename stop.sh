#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <network> (testnet|mainnet)"
  exit 1
fi

NETWORK=$1

if [ "$NETWORK" == "testnet" ]; then
  COMPOSE_FILE=docker-compose.testnet.yaml
elif [ "$NETWORK" == "mainnet" ]; then
  COMPOSE_FILE=docker-compose.mainnet.yaml
else
  echo "Invalid network '$NETWORK'. Must be testnet or mainnet."
  exit 1
fi

docker-compose -f $COMPOSE_FILE down
