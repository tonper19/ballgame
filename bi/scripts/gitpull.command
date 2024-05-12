#!/bin/bash

# WBSC Europe Baseball and Softball Sabermetrics Statistics App
# MacOS Bash script to get the latest application version from Github
# This script is to be executed by double clicking on it
# to do a Github refresh on-demand
# Caveat: any change on the application will be discarded.
# when        who                   what
# ----------  --------------------  ---------------------------------
# 12/05/2024  Tony Pérez            initial

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
echo " "
echo "==================================================================================="
echo "WBSC Europe Baseball and Softball Sabermetrics Statistics App"
echo "Github Refresh"
echo "Date/Time: $current_datetime"
echo "==================================================================================="
echo " "
cd ~/baseball/ballgameBI/
git reset --hard
git pull
