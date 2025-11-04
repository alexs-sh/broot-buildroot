#!/bin/bash

MODE=""
CONFIG_NAME=broot
CONFIG_FILE=${CONFIG_NAME}.config
CMD="./utils/test-pkg -p broot  -c broot.config"

if [ "$#" -ge 1 ]; then
   MODE=$1
fi


set -e
. "$HOME/.cargo/env"


cp -f configs/$CONFIG_FILE buildroot/
cd buildroot

if [ "$MODE" = "all" ]; then
  CMD+=" --all"
fi

export FORCE_UNSAFE_CONFIGURE=1
eval "$CMD"
