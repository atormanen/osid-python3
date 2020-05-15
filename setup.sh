#!/bin/bash

sudo apt-get install python3 python3-pip dcfldd
sudo pip3 install cherrypy

#Move preconfigured files to system folder
sudo mv /root/osid-python3/preconfigured/* /root/osid-python3/system/
sudo chmod 0777 /root/osid-python3/system/run_app.sh

#Create directory for image store
mkdir -p /etc/osid/imgroot/


#test = $(ip route get 8.8.8.8 | sed -n '/src/{s/.*src *\([^ ]*\).*/\1/p;q}')
sed -i 's/^Host = localhost/Host = 10.10.104.105$test/g' server.ini
