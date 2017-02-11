#!/bin/bash
echo "plaese enter the word which you want to search"
read uname
echo "please enter the file name in which you want to search"
read filename
echo   "please find node1 output"
(echo
echo   " **************************************Below are Node-1 output***************************************** "
echo
cd /jboss-7.1.1/standalone/log
grep -B 2 -A 5 $uname $filename )>> /output/$uname-`date +%d-%m-%y-%H-%M`.out


