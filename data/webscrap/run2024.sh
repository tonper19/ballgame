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
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/batting ../csv/stats_batting_raw_d1_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/pitching ../csv/stats_pitching_raw_d1_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/fielding ../csv/stats_fielding_raw_d1_2024.csv

printf "\n"
printf "########\n"
printf "## D2 ##\n"
printf "########\n"

printf "\n"
printf "#### BE D2 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d2/stats/general/all/batting ../csv/stats_batting_raw_d2_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d2/stats/general/all/pitching ../csv/stats_pitching_raw_d2_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d2/stats/general/all/fielding ../csv/stats_fielding_raw_d2_2024.csv

printf "\n"
printf "########\n"
printf "## D3 ##\n"
printf "########\n"

printf "\n"
printf "#### BE D3 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d3/stats/general/all/batting ../csv/stats_batting_raw_d3_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d3/stats/general/all/pitching ../csv/stats_pitching_raw_d3_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d3/stats/general/all/fielding ../csv/stats_fielding_raw_d3_2024.csv

printf "\n"
printf "########\n"
printf "## D4 ##\n"
printf "########\n"

printf "\n"
printf "#### BE D4 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d4/stats/general/all/batting ../csv/stats_batting_raw_d4_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d4/stats/general/all/pitching ../csv/stats_pitching_raw_d4_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d4/stats/general/all/fielding ../csv/stats_fielding_raw_d4_2024.csv

printf "\n\n"
printf "###########################\n"
printf "# Belgium Softball Ladies #\n"
printf "###########################\n"

printf "\n"
printf "##########\n"
printf "## SDD1 ##\n"
printf "##########\n"

printf "\n"
printf "#### BE SDD1 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d1/stats/general/all/batting ../csv/stats_batting_raw_sdd1_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d1/stats/general/all/pitching ../csv/stats_pitching_raw_sdd1_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d1/stats/general/all/fielding ../csv/stats_fielding_raw_sdd1_2024.csv

printf "\n"
printf "##########\n"
printf "## SDD2 ##\n"
printf "##########\n"

printf "\n"
printf "#### BE SDD2 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d2/stats/general/all/batting ../csv/stats_batting_raw_sdd2_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d2/stats/general/all/pitching ../csv/stats_pitching_raw_sdd2_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d2/stats/general/all/fielding ../csv/stats_fielding_raw_sdd2_2024.csv

printf "\n\n"
printf "###########################\n"
printf "# Belgium Softball Men    #\n"
printf "###########################\n"

printf "\n"
printf "##########\n"
printf "## SMD1 ##\n"
printf "##########\n"

printf "\n"
printf "#### BE SMD1 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-d1/stats/general/all/batting ../csv/stats_batting_raw_smd1_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-d1/stats/general/all/pitching ../csv/stats_pitching_raw_smd1_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-d1/stats/general/all/fielding ../csv/stats_fielding_raw_smd1_2024.csv

printf "\n\n"
printf "#############################\n"
printf "# Belgium Softball Reserves #\n"
printf "#############################\n"

printf "\n"
printf "##########\n"
printf "## SRES ##\n"
printf "##########\n"

printf "\n"
printf "#### BE SRES 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-reserves/stats/general/all/batting ../csv/stats_batting_raw_sres_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-reserves/stats/general/all/pitching ../csv/stats_pitching_raw_sres_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-reserves/stats/general/all/fielding ../csv/stats_fielding_raw_sres_2024.csv

printf "#########################\n"
printf "# Italy Baseball        #\n"
printf "#########################\n"

printf "\n"
printf "#############\n"
printf "## Serie A ##\n"
printf "#############\n"

printf "\n"
printf "#### IT A 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.fibs.it/en/events/2024-serie-a-baseball/stats/general/all/batting ../csv/stats_batting_raw_seriea_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.fibs.it/en/events/2024-serie-a-baseball/stats/general/all/pitching ../csv/stats_pitching_raw_seriea_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.fibs.it/en/events/2024-serie-a-baseball/stats/general/all/fielding ../csv/stats_fielding_raw_seriea_2024.csv

printf "#########################\n"
printf "# Austria Baseball      #\n"
printf "#########################\n"

printf "\n"
printf "#########################\n"
printf "## Baseball Bundesliga ##\n"
printf "#########################\n"

printf "\n"
printf "#### AT ABDL 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.baseballsoftball.at/de/events/baseball-bundesliga-2024/stats/general/all/batting ../csv/stats_batting_raw_abdl_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.baseballsoftball.at/de/events/baseball-bundesliga-2024/stats/general/all/pitching ../csv/stats_pitching_raw_abdl_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.baseballsoftball.at/de/events/baseball-bundesliga-2024/stats/general/all/fielding ../csv/stats_fielding_raw_abdl_2024.csv

printf "#########################\n"
printf "# Netherlands Baseball  #\n"
printf "#########################\n"

printf "\n"
printf "#########################\n"
printf "## Honkbal Hoofklasse  ##\n"
printf "#########################\n"

printf "\n"
printf "#### NL HK 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://stats.knbsbstats.nl/en/events/2024-lucky-day-hoofdklasse-honkbal/stats/general/all/batting ../csv/stats_batting_raw_hk_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://stats.knbsbstats.nl/en/events/2024-lucky-day-hoofdklasse-honkbal/stats/general/all/pitching ../csv/stats_pitching_raw_hk_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://stats.knbsbstats.nl/en/events/2024-lucky-day-hoofdklasse-honkbal/stats/general/all/fielding ../csv/stats_fielding_raw_hk_2024.csv

printf "#########################\n"
printf "# Spain Baseball        #\n"
printf "#########################\n"

printf "\n"
printf "#############################\n"
printf "## Spanish Baseball League ##\n"
printf "#############################\n"

printf "\n"
printf "#### ES SBL 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.rfebs.es/es/events/2024-spanish-baseball-league/stats/general/all/batting ../csv/stats_batting_raw_sbl_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.rfebs.es/es/events/2024-spanish-baseball-league/stats/general/all/pitching ../csv/stats_pitching_raw_sbl_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.rfebs.es/es/events/2024-spanish-baseball-league/stats/general/all/fielding ../csv/stats_fielding_raw_sbl_2024.csv

printf "#########################\n"
printf "# Spain Softball        #\n"
printf "#########################\n"

printf "\n"
printf "####################################\n"
printf "## Spanish Softball League Ladies ##\n"
printf "####################################\n"

printf "\n"
printf "#### ES SSL 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://www.rfebs.es/es/events/2024-spanish-softball-league/stats/general/all/batting ../csv/stats_batting_raw_ssl_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://www.rfebs.es/es/events/2024-spanish-softball-league/stats/general/all/pitching ../csv/stats_pitching_raw_ssl_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://www.rfebs.es/es/events/2024-spanish-softball-league/stats/general/all/fielding ../csv/stats_fielding_raw_ssl_2024.csv

printf "#########################\n"
printf "# Netherlands Softball  #\n"
printf "#########################\n"

printf "\n"
printf "#############################\n"
printf "## Softbal Hoofdklasse     ##\n"
printf "#############################\n"

printf "\n"
printf "#### NL SHK 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://stats.knbsbstats.nl/en/events/2024-hoofdklasse-softbal/stats/general/all/batting ../csv/stats_batting_raw_shk_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://stats.knbsbstats.nl/en/events/2024-hoofdklasse-softbal/stats/general/all/pitching ../csv/stats_pitching_raw_shk_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://stats.knbsbstats.nl/en/events/2024-hoofdklasse-softbal/stats/general/all/fielding ../csv/stats_fielding_raw_shk_2024.csv

printf "###########################\n"
printf "# United Kingdom Baseball #\n"
printf "###########################\n"

printf "\n"
printf "##############################\n"
printf "## National Baseball League ##\n"
printf "##############################\n"

printf "\n"
printf "#### GB NBL 2024\n"
/Users/tonper/.asdf/shims/npm run webBattingScrapper https://stats.britishbaseball.org.uk/en/events/2024-nbl/stats/general/all/batting ../csv/stats_batting_raw_nbl_2024.csv
/Users/tonper/.asdf/shims/npm run webPitchingScrapper https://stats.britishbaseball.org.uk/en/events/2024-nbl/stats/general/all/pitching ../csv/stats_pitching_raw_nbl_2024.csv
/Users/tonper/.asdf/shims/npm run webFieldingScrapper https://stats.britishbaseball.org.uk/en/events/2024-nbl/stats/general/all/fielding ../csv/stats_fielding_raw_nbl_2024.csv


printf "\n\n"
printf "\n\n"
printf "#########################\n"
printf "# FINISH                #\n"
printf "#########################\n"
