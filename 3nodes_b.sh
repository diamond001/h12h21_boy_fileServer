#!/bin/bash
rm -rvf *
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
mkdir -p /root/swarm/bee/node-{1,2,3}
mkdir -p /root/swarm/clef/clef-{1,2,3}
chmod 777 -R /root/swarm
mkdir -p /root/bee
cd /root/bee
wget https://raw.githubusercontent.com/diamond001/h12h21_boy_fileServer/main/3nodes_b.yml -O docker-compose.yml
docker-compose up -d
docker-compose restart
apt-get install tree
tree -a /root/swarm
