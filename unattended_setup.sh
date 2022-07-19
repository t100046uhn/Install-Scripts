#!/bin/bash

#Installation of unattended-upgrades
apt-get update && apt-get -y dist-upgrade
apt-get -y install unattended-upgrades
dpkg-reconfigure --priority=low unattended-upgrades
