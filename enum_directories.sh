#!/bin/bash
echo "What is the remote hosts URL?"
read RHIP
echo "What is the remote host URL Port number? for multiple port input , with no space"
read RHPORT

echo "Now running a directory curl request on the URL and Port."
curl http://$RHIP:$RHPORT -v

echo "Running targeted Scans against specific port review the version numbers $RHIP"
sudo nmap -p $RHPORT $RHIP -sCV -A -T4 -O -Pn > Targetedscan.txt

echo "Now running a nmap methods scan on the URL and Port."
nmap --script http-methods $RHIP:$RHPORT

echo "Now running a directory nikto scan on the URL and Port."
nikto -url $RHIP:$RHPORT

echo "Now running a directory dirb scan on the URL and Port."
dirb http://$RHIP:$RHPORT/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt

echo "Now running a directory ffuf scan on the URL and Port."
ffuf -w /opt/SecLists/Discovery/Web-Content/directory-list-lowercase-2.3-big.txt -u http://$RHIP:$RHPORT/FUZZ -t 100

echo "Now running a directory gobuster scan on the URL and Port."
sudo gobuster dir --url http://$RHIP:$RHPORT/ --wordlist /home/kali/Desktop/monster-dir-list.txt


echo "Scan is finished"

