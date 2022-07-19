#!/bin/bash

#Installation of PostgreSQL14
apt-get update && apt-get -y dist-upgrade
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
apt-get update
apt-get -y install postgresql
systemctl status postgresql

read -p "Press enter to continue"

#Installation of pgAdmin4
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
apt-get -y install pgadmin4-web
/usr/pgadmin4/bin/setup-web.sh
