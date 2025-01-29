#!/bin/bash

now="$(date +'%m-%d-%Y')"
while true; do
	read -p "Have you stopped the server? (y/n)" yn
	case $yn in
		[Yy]* ) echo "Proceeding with Server Update Process"; break;;
		[Nn]* ) echo "Go stop the server and restart the S.U.P."; exit;;
		* ) echo "Invalid Response. Please enter y or n.";;
	esac
	read -p "Have you backed up the world file.. just in case? " yn_2
    case $yn_2 in
        [Yy]* ) echo "Okay, proceeding..."; break;;
        [Nn]* ) echo "I got you. Making world backup now"; mkdir /home/backup/"$now"; cp -r /home/atm10/world /home/backup/"$now";;
        * ) echo "Invalid response. Please enter y or n.";;
    esac
done

echo 'Unzipping Server Files'
unzip '*.zip'
echo 'Switching to the extracted directory'
cd */ 
echo 'Deleting bloat'
rm *.bat *.txt *.log
echo 'Deleting files to be replaced in update'
rm -r /home/atm10/mods /home/atm10/config /home/atm10/defaultconfigs /home/atm10/kubejs /home/atm10/libraries /home/atm10/*.jar
echo 'Merging files into server install'
cp -rf * /home/atm10
echo 'Returning to downloads folder'
cd /home/downloads
echo 'Deleting leftover files'
rm -r !(*.sh)