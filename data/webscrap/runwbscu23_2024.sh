#!/bin/bash
clear
current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
echo " "
echo "==================================================================================="
echo "BALLGAMEMETRICS"
echo "Web scraping"
echo "Date/Time: $current_datetime"
echo "==================================================================================="
echo " "

printf "#########################\n"
printf "#########################\n"
printf "##   International     ##\n"
printf "#########################\n"
printf "#########################\n"


printf "#########################\n"
printf "#        WBSC           #\n"
printf "#########################\n"

printf "\n"
printf "############################\n"
printf "## U23 Baseball World Cup ##\n"
printf "############################\n"


printf "\n"
printf "#### WBSC U23 Baseball World Cup 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.wbsc.org/en/events/2024-v-u-23-baseball-world-cup/stats/general/all/batting ../csv/stats_batting_raw_wbscu23_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.wbsc.org/en/events/2024-v-u-23-baseball-world-cup/stats/general/all/pitching ../csv/stats_pitching_raw_wbscu23_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.wbsc.org/en/events/2024-v-u-23-baseball-world-cup/stats/general/all/fielding ../csv/stats_fielding_raw_wbscu23_2024.csv
