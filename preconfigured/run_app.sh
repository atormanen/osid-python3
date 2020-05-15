#!/usr/bin/env bash
cd /root/osid-python3/system
sudo /usr/bin/python3 server.py

# Allow Cherrypy to boot up
#sleep 5
#chromium-browser --app=http://hostname:port
