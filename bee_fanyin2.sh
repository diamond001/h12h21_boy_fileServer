#!/bin/bash
# scp -r root@47.241.251.98:/root/fileServer/bee_fanyin2.sh ./
apt-get install -y jq
wget https://github.com/ethersphere/bee/releases/download/v0.6.2/bee_0.6.2_amd64.deb
wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.12/bee-clef_0.4.12_amd64.deb
dpkg -i bee-clef_0.4.12_amd64.deb
dpkg -i bee_0.6.2_amd64.deb
# bee-get-addr
cat>/etc/bee/bee.yaml<<EOF
#!/bin/bash
clef-signer-enable: true
clef-signer-endpoint: /var/lib/bee-clef/clef.ipc
config: /etc/bee/bee.yaml
data-dir: /var/lib/bee
debug-api-addr: 127.0.0.1:1635
debug-api-enable: true
password-file: /var/lib/bee/password
swap-enable: true
swap-endpoint: https://goerli.infura.io/v3/56d443cd4eea46d585479e60c129f453
swap-initial-deposit: "10000000000000000" 
EOF
systemctl restart systemd-journald
chown -R bee:bee /var/lib/bee
systemctl start bee
wget -O cashout.sh https://gist.githubusercontent.com/ralph-pichler/3b5ccd7a5c5cd0500e6428752b37e975/raw/b40510f1172b96c21d6d20558ca1e70d26d625c4/cashout.sh && chmod +x cashout.sh
sed -i '3s/MIN_AMOUNT=10*$/MIN_AMOUNT=10000/g' cashout.sh
echo "00 02 * * * /root/cashout.sh cashout-all" >> /var/spool/cron/crontabs/root
/usr/bin/bee-clef-keys
mkdir -p /root/key/0.6.2
mv *.json /root/key/0.6.2/
mv *.txt /root/key/0.6.2/






