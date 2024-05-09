#!/bin/bash
clear
printf "#########################\n"
printf "#########################\n"
printf "##        2024         ##\n"
printf "#########################\n"
printf "#########################\n"

printf "#########################\n"
printf "# Belgium Baseball      #\n"
printf "#########################\n"

printf "\n"
printf "########\n"
printf "## D1 ##\n"
printf "########\n"

printf "\n"
printf "#### BE D1 2024\n"
npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/batting ../csv/stats_batting_raw_d1_2024.csv
npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/pitching ../csv/stats_pitching_raw_d1_2024.csv
npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/fielding ../csv/stats_fielding_raw_d1_2024.csv

