#Installation of Kasm Workspaces
#Tested on a clean Debian 11
#!/bin/bash
sudo dd if=/dev/zero bs=1M count=5120 of=/mnt/5GiB.swap
sudo chmod 600 /mnt/5GiB.swap
sudo mkswap /mnt/5GiB.swap
sudo swapon /mnt/5GiB.swap

cat /proc/swaps

echo '/mnt/5GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab

cd /tmp
wget https://kasm-static-content.s3.amazonaws.com/kasm_release_1.11.0.d0ebc3.tar.gz
tar -xf kasm_release*.tar.gz
sudo bash kasm_release/install.sh

#If you would like to run the Web Application on a different port pass the -L flag when calling the installer
#sudo bash kasm_release/install.sh -L 8443

#Default Login
#Access the Web Application running on port 443 at https://<WEBAPP_SERVER>
#Log into the Web Application as the Administrator using the default credentials produced during the install.
