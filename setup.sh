#!/bin/bash

sudo apt-get install python3 python3-pip dcfldd
sudo pip3 install cherrypy

#Move preconfigured files to system folder
sudo mv /root/osid-python3/preconfigured/* /root/osid-python3/system/
sudo chmod 0777 /root/osid-python3/system/run_app.sh

#Create directory for image store
mkdir -p /etc/osid/imgroot/


ip=$(ip -o addr show up primary scope global |
      while read -r num dev fam addr rest; do echo ${addr%/*}; done)
sed -i 's/^Host = localhost/Host = $ip/g' /root/osid-python3/system/server.ini
