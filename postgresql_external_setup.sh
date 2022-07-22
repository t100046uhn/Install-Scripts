#!/bin/bash

#Update OS
apt-get update && apt-get dist-upgrade

#Installation of PostgreSQL14
apt-get update && apt-get dist-upgrade
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
apt-get update
apt-get -y install postgresql
systemctl status postgresql

read -p "Press enter to continue"

#Create a backup of the config file
cp /etc/postgresql/14/main/postgresql.conf /etc/postgresql/14/main/postgresql.conf.bak

sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/14/main/postgresql.conf

#Create a backup of the pg_hba config file
cp /etc/postgresql/14/main/pg_hba.conf /etc/postgresql/14/main/pg_hba.conf.bak

echo '#Manual Entries Below' | sudo tee -a /etc/postgresql/14/main/pg_hba.conf
echo 'host  all   all   0.0.0.0/0   md5' | sudo tee -a /etc/postgresql/14/main/pg_hba.conf
echo 'host  all   all   ::/0        md5' | sudo tee -a /etc/postgresql/14/main/pg_hba.conf

systemctl restart postgresql
