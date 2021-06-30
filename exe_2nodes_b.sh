#!/bin/bash
# scp -r .env root@192.168.0.141:/root/bee/
# scp -r .env root@192.168.0.137:/root/bee/
# scp -r .env root@192.168.0.134:/root/bee/
# scp -r .env root@192.168.0.133:/root/bee/
# scp -r .env root@192.168.0.135:/root/bee/
# scp -r .env root@192.168.0.136:/root/bee/
# scp -r .env root@192.168.0.130:/root/bee/
# scp -r .env root@192.168.0.129:/root/bee/
# scp -r .env root@192.168.0.132:/root/bee/
ssh root@192.168.0.132 "wget https://raw.githubusercontent.com/diamond001/h12h21_boy_fileServer/main/3nodes.sh -O 3nodes.sh;
                        chmod +x 3nodes.sh; 
			./3nodes.sh"
