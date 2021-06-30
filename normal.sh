#!/bin/bash

## 1. backup
mkdir -p /root/backup/var/lib/bee
mkdir -p /root/backup/etc/
cp -rvf /var/lib/bee/keys /root/backup/var/lib/bee
cp -rvf /var/lib/bee/password /root/backup/var/lib/bee
cp -rvf /var/lib/bee-clef /root/backup/var/lib
cp -rvf /etc/bee/ /root/backup/etc
cp -rvf /etc/bee-clef /root/backup/etc

## 2. stop bee and bee-clef
systemctl stop bee
systemctl stop bee-clef

## just a test...
bee-get-addr >> ethereumAddr.txt

## 3. download and install
wget https://github.com/ethersphere/bee/releases/download/v1.0.0/bee_1.0.0_amd64.deb
wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.13/bee-clef_0.4.13_amd64.deb
dpkg -i bee-clef_0.4.13_amd64.deb
dpkg -i bee_1.0.0_amd64.deb

## 4. config
## https://account.getblock.io/
cat>/etc/bee/bee.yaml<<EOF
clef-signer-enable: false
config: /etc/bee/bee.yaml
data-dir: /var/lib/bee
debug-api-addr: 127.0.0.1:1635
db-open-files-limit: 2000
debug-api-enable: true
full-node: true
mainnet: true
network-id: 1
password-file: /var/lib/bee/password
swap-enable: true
swap-endpoint: https://stake.getblock.io/mainnet/?api_key=2763bc8b-6fbe-47c1-b4d7-8cb7398a50ed
swap-initial-deposit: 0
verbosity: trace
welcome-message: "定局工作小组"
EOF

## 5. get ethereum addr
bee-get-addr >> ethereumAddr.txt

## 6. start
systemctl restart systemd-journald
chown -R bee:bee /var/lib/bee
systemctl start bee

## 7. log
journalctl -u bee -f

## 8. monitor
# 查看连接bee状态
# curl http://localhost:1633
# 查看bee健康状态和版本号：
# curl http://localhost:1635/health
# 查看连接的对等节点数
# curl -s http://localhost:1635/peers | jq '.peers | length'
# 查看自己的钱包地址
# curl -s localhost:1635/addresses | jq .ethereum
# 查看自己的支票合约账本地址
# curl -s http://localhost:1635/chequebook/address | jq .chequebookAddress
# 查询支票
# curl localhost:1635/chequebook/cheque | jq
