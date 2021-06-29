#!/bin/bash
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
#mkdir -p /root/swarm/bee/node-{1,2,3}
#mkdir -p /root/swarm/clef/clef-{1,2,3}
#chmod 777 -R /root/swarm
mkdir -p /root/bee
cd /root/bee
wget -c https://raw.githubusercontent.com/diamond001/h12h21_boy_fileServer/main/docker-compose.yml
docker-compose up -d
chmod 777 -R /root/swarm
docker-compose restart
sleep 5
tree -a /root/swarm
