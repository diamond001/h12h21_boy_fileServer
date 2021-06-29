#!/bin/bash
apt-get update
apt install -y jq

# to install docker
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
apt-get remove docker docker-engine docker.io containerd runc
# apt-get update
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

# to install docker-compose
# https://docs.docker.com/compose/install/#install-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# to download bee, .env and docker-compose.yaml
# https://github.com/ethersphere/bee/tree/master/packaging/docker
mkdir -p bee && cd bee
scp -r root@47.241.250.179:/root/fileServer/docker-compose.yml ./
scp -r root@47.241.250.179:/root/fileServer/.env ./
docker-compose pull
# sleep 5
# docker-compose up –d
