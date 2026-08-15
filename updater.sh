#!/usr/bin/env bash
cd "$(dirname "$0")"
if ! command -v curl >/dev/null 2>&1 || ! command -v lsof >/dev/null 2>&1; then
 if ! command -v curl >/dev/null 2>&1; then
 echo "Error: curl is not installed."
 echo
 fi
 if ! command -v lsof >/dev/null 2>&1; then
 echo "Error: lsof is not installed."
 echo
 fi
read -n 1 -p ""
exit
fi
curl "https://ipfs.io/ipns/link/test.txt" -f -s -o /dev/null
if [[ $? = 22 ]]; then
read -n 1 -p "I need ipfs.io connectivity to update. Please check your Internet connection. "
exit
fi
UPD=(VERSION*)
if [ ! -f $UPD ]; then
mkdir "./X"
cd "./X"
fi
lsof -t "./ld-linux-x86-64.so.2" 2>/dev/null | xargs -r kill
if [[ -f "./AUTO.no" ]]; then
cp "./AUTO.no" "./data/AUTO.no"
fi
cp -r "./data" ~/data >/dev/null 2>&1
rm -r *
curl "https://ipfs.io/ipns/link/file.tar.gz" -O
tar -xvzf "./file.tar.gz"
rm "./file.tar.gz"
cp -r ~/data "./" >/dev/null 2>&1
rm -r ~/data >/dev/null 2>&1
if [[ -f "./data/AUTO.no" ]]; then
cp "./data/AUTO.no" "./AUTO.no"
rm "./data/AUTO.no"
fi
