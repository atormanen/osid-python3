#!/bin/bash

#Install dependencies
sudo apt-get install python3 python3-pip dcfldd
sudo pip3 install cherrypy

#Move sample files to subdirectory to keep system folder clean
sudo mkdir /root/osid-python3/system/sample
sudo mv /root/osid-python3/system/*.sample /root/osid-python3/system/sample

#Move preconfigured files to system folder
sudo mv /root/osid-python3/preconfigured/* /root/osid-python3/system/
sudo chmod 0777 /root/osid-python3/system/run_app.sh

#Create directory for image store
mkdir -p /etc/osid/imgroot/

#Add host ip to server.ini config file
ips=$(ip -o addr show up primary scope global |
      while read -r num dev fam addr rest; do echo ${addr%/*}; done)
sed -i "s/^Host = localhost/Host = ${ips}/g" /root/osid-python3/system/server.ini

cd /root/osid-python3/system
./run_app.sh
