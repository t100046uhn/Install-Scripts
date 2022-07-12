#!/bin/bash
#set this to run as a cron job

#Script requires 4 files to work
#username file
#password file
#subdomain file
#setipaddr file

#variable definitions
#remove curly brackets when inputting file path
username=$(<{path to file}) 
password=$(<{path to file})
subdomain=$(<{path to file})
ipaddr="$(curl -s ifconfig.me)"


#Google dynamic dns api url listed below
#curl "https://$username:$password@domains.google.com/nic/update?hostname=$subdomain&myip=$ipaddr"

setipaddr=$(<{path to file})

if [ "$setipaddr" = "$ipaddr" ];
then
    echo "IP remains $ipaddr. DNS does not need updating"
else
    dnsupdate="$(curl "https://$username:$password@domains.google.com/nic/update?hostname=$subdomain&myip=$ipaddr")"
    if [[ "$dnsupdate" == *"good"* ]];
    then
        echo "IP updated successfully!"
        echo $dnsupdate
        echo $ipaddr > {path to file}       #same as the file for the setipaddr variable
    else
        echo "DNS update failed"
        echo $dnsupdate
    fi
fi


#Log creations
#ensure all folders are created so logs can be generated
time=$(date +"%F_%R")
echo "$dnsupdate" > {path to folder}/$time-dns_results.log
