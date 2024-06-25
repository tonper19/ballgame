#!/bin/bash
clear

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
echo " "
echo "==================================================================================="
echo "WBSC Europe Baseball and Softball Sabermetrics Statistics App"
echo "INTERNATIONAL COMPETITIONS"
echo "Web scraping"
echo "Date/Time: $current_datetime"
echo "==================================================================================="
echo " "

printf "#########################\n"
printf "#########################\n"
printf "##        2024         ##\n"
printf "#########################\n"
printf "#########################\n"

printf "##############################\n"
printf "# INTERNATIONAL COMPETITIONS #\n"
printf "##############################\n"

printf "\n"
printf "###########################\n"
printf "## Baseball European Cup ##\n"
printf "###########################\n"

printf "\n"
printf "#### INTL EUR CUP 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.wbsceurope.org/en/events/2024-baseball-european-cup-2024/stats/general/all/batting ../csv/stats_batting_raw_beucup_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.wbsceurope.org/en/events/2024-baseball-european-cup-2024/stats/general/all/pitching ../csv/stats_pitching_raw_beucup_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.wbsceurope.org/en/events/2024-baseball-european-cup-2024/stats/general/all/fielding ../csv/stats_fielding_raw_beucup_2024.csv

printf "\n"
printf "######################################\n"
printf "## Baseball European Federation Cup ##\n"
printf "######################################\n"

printf "\n"
printf "#### INTL EUR FED CUP 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.wbsceurope.org/en/events/2024-baseball-federation-cup-Group-Switzerland/stats/general/all/batting ../csv/stats_batting_raw_beufcup_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.wbsceurope.org/en/events/2024-baseball-federation-cup-Group-Switzerland/stats/general/all/pitching ../csv/stats_pitching_raw_beufcup_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.wbsceurope.org/en/events/2024-baseball-federation-cup-Group-Switzerland/stats/general/all/fielding ../csv/stats_fielding_raw_beufcup_2024.csv

printf "\n\n"
printf "\n\n"
printf "#########################\n"
printf "# FINISH                #\n"
printf "#########################\n"
