#!/bin/bash
sudo true

echo "Install mongodb and start mongod"
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update -y && sudo apt-get install -y mongodb-org && sudo service mongod start && systemctl enable mongod
netstat -tnlp

echo "Config mongo"
echo "------------------------------------"

echo "Mongo Stop"
systemctl stop mongod 

echo "Create folder /data"
mkdir -p /data
mkdir -p /data/log/mongod 
cd /data
chown -R mongodb.mongodb log

cd 

sed "s/APP_DOMAIN/$app_domain/g;s/APP_PORT/$app_port/g" /etc/mongod.conf && systemctl reload nginx
vi /etc/mongod.conf 


storage:
  dbPath: /data/mongodb
....

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /data/log/mongodb/mongod.log


mv /var/lib/mongodb /data/

systemctl start mongod
netstat -tnlp
df -h

tail -n 100 /var/log/mongodb/mongod.log
tail -n 100 /data/log/mongodb/mongod.log