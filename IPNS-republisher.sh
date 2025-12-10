#!/usr/bin/env bash
cd "$(dirname "$0")"
./ipfs init
./ipfs daemon &
sleep 10
./ipfs routing get /ipns/link > record.bin
curl -i -X PUT https://delegated-ipfs.dev/routing/v1/ipns/link -H "Content-Type: application/vnd.ipfs.ipns-record" --data-binary @record.bin
