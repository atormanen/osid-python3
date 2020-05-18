#!/bin/bash

#Install dependencies
sudo apt-get install python3 python3-pip dcfldd
sudo pip3 install cherrypy

#Move sample files to subdirectory to keep system folder clean
sudo mkdir /root/osid-python3/system/sample
sudo mv /root/osid-python3/system/*.sample /root/osid-python3/system/sample

#Copy preconfigured files to system folder
sudo cp /root/osid-python3/preconfigured/server.ini /root/osid-python3/system/
sudo cp /root/osid-python3/preconfigured/run_app.sh /root/osid-python3/system/
sudo chmod 0777 /root/osid-python3/system/run_app.sh

sudo cp /root/osid-python3/preconfigured/osid-python.service /etc/systemd/system/

#Create directory for access log
sudo mkdir /var/osid/
sudo touch /var/osid/access.log

#Create directory for image store
mkdir -p /etc/osid/imgroot/

#Add host ip to server.ini config file
ips=$(ip -o addr show up primary scope global |
      while read -r num dev fam addr rest; do echo ${addr%/*}; done)
sed -i "s/^Host = localhost/Host = ${ips}/g" /root/osid-python3/system/server.ini

#Run application
#cd /root/osid-python3/system
#./run_app.sh
sudo systemctl daemon-reload
#sudo systemctl enable osid-python.service
#sudo systemctl start osid-python.service
