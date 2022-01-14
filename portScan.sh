#!/bin/bash
#bash portScan.sh 000.000.000.000

function portscan() {
  for p in {1..65535}; do
    printf "%06d\r" $p
    bash -c "(>/dev/tcp/$1/$p)" 2> /dev/null && echo open: $p &
    read -t0.5
    kill $! &>/dev/null
  done
}

portscan $1