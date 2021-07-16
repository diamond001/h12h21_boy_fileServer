#!/bin/bash
/usr/bin/nohup /root/openethereum/openethereum --chain=xdai --base-path=/root/openethereum/data --db-path=/root/openethereum/data/db --jsonrpc-hosts="all" --jsonrpc-interface=all  --jsonrpc-threads=8 >/root/openethereum/1.log 2>&1 &
