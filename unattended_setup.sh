#Installation of unattended-upgrades
#!/bin/bash
apt-get install unattended-upgrades
dpkg-reconfigure --priority=low unattended-upgrades
