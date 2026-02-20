#!/usr/bin/env bash

# # Import the public key.
# sudo apt-get install gnupg curl
# curl -fsSL https://pgp.mongodb.com/server-8.0.asc | \
#    sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
#    --dearmor

# # Create the list file
# echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.com/apt/ubuntu noble/mongodb-enterprise/8.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-enterprise-8.2.list

# sudo apt-get update -y
# sudo apt-get install mongodb-enterprise -y

# sudo systemctl daemon-reload
# sleep 5
# sudo systemctl start mongod
# sleep 5
# sudo systemctl status mongod

####### Installation of MongoDB Community
sudo apt-get install -y libcurl4 libgssapi-krb5-2 libldap2 libwrap0 libsasl2-2 libsasl2-modules libsasl2-modules-gssapi-mit openssl  liblzma5 gnupg

wget -q https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-ubuntu2404-8.2.5.tgz #-P /home/vagrant/
tar -zxvf mongodb-*-8.2.5.tgz
sudo cp /home/vagrant/mongodb-linux-x86_64-ubuntu2404-8.2.5/bin/* /usr/local/bin/

sudo mkdir -p /var/lib/mongo
sudo mkdir -p /var/log/mongodb
sudo chown `whoami` /var/lib/mongo     # Or substitute another user
sudo chown `whoami` /var/log/mongodb   # Or substitute another user

# install Mongosh
wget -qO- https://www.mongodb.org/static/pgp/server-8.0.asc | sudo tee /etc/apt/trusted.gpg.d/server-8.0.asc
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
sudo apt-get update -y
sudo apt-get install -y mongodb-mongosh
mongosh --version
echo "MONGOSH IS INSTALLED"
sleep 5

#run mongo
sudo mongod --dbpath /var/lib/mongo --logpath /var/log/mongodb/mongod.log --fork --bind_ip_all
sudo cat /var/log/mongodb/mongod.log | grep "Waiting for connections"

# mongosh <<EOF
# use MERN
# db.createUser(
#   {
#     user: "mern",
#     pwd:  "mern",   // or cleartext password
#     roles: [ { role: "readWrite", db: "MERN" } ]
#   }
# )
# EOF

######### SEED DATABASE ##########
# mongoimport installation https://www.mongodb.com/docs/database-tools/installation/?operating-system=linux&package-type=deb#std-label-dbtools_installation
# mongoimport --uri mongodb://mern:mern@10.0.0.1/MERN --collection Cruds --type json --file Cruds.json --jsonArray