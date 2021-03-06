#!/usr/bin/env bash

#Remove old server.ini file and copy preconfigured file so we can readd the
#ip address
sudo rm /root/osid-python3/system/server.ini
sudo cp /root/osid-python3/preconfigured/server.ini /root/osid-python3/system/

#Add host ip to server.ini config file
ips=$(ip -o addr show up primary scope global |
      while read -r num dev fam addr rest; do echo ${addr%/*}; done)
sed -i "s/^Host = localhost/Host = ${ips}/g" /root/osid-python3/system/server.ini

#Run server.py
cd /root/osid-python3/system
sudo /usr/bin/python3 server.py

# Allow Cherrypy to boot up
#sleep 5
#chromium-browser --app=http://hostname:port
