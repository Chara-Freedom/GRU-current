#!/usr/bin/env bash
cd "$(dirname "$0")"
UPD=(VERSION*)
curl "https://ipfs.io/ipns/k51qzi5uqu5dldod6robuflgitvj276br0xye3adipm3kc0bh17hfiv1e0hnp4/$UPD" -f -s -o /dev/null
if [[ $? -eq 22 ]]; then
read -n 1 -p "The local version does not match the latest version. Press any key if you want to skip the update, 0 or 1 if you want to update, 0 if you want to start the service after update" INP
 if [[ $INP -eq 0 || $INP -eq 1 ]]; then
 ./updater.sh
 fi
 if [[ $INP -eq 1 ]]; then
 exit
 fi
fi
