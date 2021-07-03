#!/bin/bash
rm -rvf *
wget https://raw.githubusercontent.com/diamond001/h12h21_boy_fileServer/main/docker-compose.sh
chmod +x docker-compose.sh
docker-compose.sh
################
#docker stop $(docker ps -aq)
#docker rm $(docker ps -aq)
#docker rmi $(docker images -q)
mkdir -p /root/swarm/bee/node-{1,2}
mkdir -p /root/swarm/clef/clef-{1,2}
chmod 777 -R /root/swarm
mkdir -p /root/bee
cd /root/bee
wget https://raw.githubusercontent.com/diamond001/h12h21_boy_fileServer/main/2nodes_b.yml -O docker-compose.yml
docker-compose up -d
docker-compose restart
apt install tree
tree -a /root/swarm
