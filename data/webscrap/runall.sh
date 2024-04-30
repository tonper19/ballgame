#!/bin/bash
clear
printf "#########################\n"
printf "# Belgium               #\n"
printf "#########################\n"

printf "\n "
printf "##\n"
printf "## D1\n"
printf "##\n"

printf "\n "
printf "# 2024\n"
npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/batting ../csv/stats_batting_raw_d1_2024.csv
npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/pitching ../csv/stats_pitching_raw_d1_2024.csv
npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/fielding ../csv/stats_fielding_raw_d1_2024.csv

printf "\n "
printf "# 2023\n"
npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2023-baseball-d1/stats/general/all/batting ../csv/stats_batting_raw_d1_2023.csv
npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2023-baseball-d1/stats/general/all/pitching ../csv/stats_pitching_raw_d1_2023.csv
npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2023-baseball-d1/stats/general/all/fielding ../csv/stats_fielding_raw_d1_2023.csv

printf "\n "
printf "# 2022\n"
npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2022-baseball-d1/stats/general/all/batting ../csv/stats_batting_raw_d1_2022.csv
npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2022-baseball-d1/stats/general/all/pitching ../csv/stats_pitching_raw_d1_2022.csv
npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2022-baseball-d1/stats/general/all/fielding ../csv/stats_fielding_raw_d1_2022.csv

printf "\n "
printf "# 2021\n"
npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2021-baseball-d1/stats/general/all/batting ../csv/stats_batting_raw_d1_2021.csv
npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2021-baseball-d1/stats/general/all/pitching ../csv/stats_pitching_raw_d1_2021.csv
npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2021-baseball-d1/stats/general/all/fielding ../csv/stats_fielding_raw_d1_2021.csv


printf "#########################\n"
printf "# FINISH                #\n"
printf "#########################\n"
