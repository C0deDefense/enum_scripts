#!/bin/bash
echo "What is the remote hosts IP?"
read RHIP
echo "Running Multiple Scans against $RHIP"
echo "Rustscan is running quick"
rustscan -a $RHIP >> rustscan.txt
echo "Rustscan is finished"
echo "NMAP Scan is running for TCP ports"
sudo nmap -sC -sV -oN host.txt $RHIP
echo "NMAP Scan for TCP host is finished"
echo "NMAP full port scan running"
$nmap -p- -oN fullscan.txt $RHIP
echo "NMAP full port scan finished"
echo "NMAP UDP scan running"
sudo nmap -sU -v -oN udpscan.txt $RHIP
echo "NMAP UDP scan is finished"
