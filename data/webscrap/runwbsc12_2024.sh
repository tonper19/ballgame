#!/bin/bash
clear
current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
echo " "
echo "==================================================================================="
echo "WBSC Europe Baseball and Softball Sabermetrics Statistics App"
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
printf "################\n"
printf "## Premier 12 ##\n"
printf "################\n"


printf "\n"
printf "#### WBSC Premier 12 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.wbsc.org/en/events/2024-premier12/stats/general/all/batting ../csv/stats_batting_raw_wbsc12_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.wbsc.org/en/events/2024-premier12/stats/general/all/pitching ../csv/stats_pitching_raw_wbsc12_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.wbsc.org/en/events/2024-premier12/stats/general/all/fielding ../csv/stats_fielding_raw_wbsc12_2024.csv
