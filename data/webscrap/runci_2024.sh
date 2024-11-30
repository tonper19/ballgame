#!/bin/bash
clear
current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
echo " "
echo "==================================================================================="
echo "Ballgame Metrics App"
echo "Web scraping"
echo "Date/Time: $current_datetime"
echo "==================================================================================="
echo " "

printf "############################\n"
printf "############################\n"
printf "##  Islas Canarias, Spain ##\n"
printf "############################\n"
printf "############################\n"


printf "#########################\n"
printf "#      Baseball         #\n"
printf "#########################\n"

printf "\n"
printf "####################################\n"
printf "##  2024 Tenerife Winter League   ##\n"
printf "####################################\n"

printf "\n"
printf "#############\n"
printf "## GROUP B ##\n"
printf "#############\n"

/Users/tonper/.asdf/shims/npm run fileBattingScrapper ~/Development/DWH/ballgame/data/HTML/TWL2024U13B.htm ../csv/stats_batting_raw_twlu13b_2024.csv
/Users/tonper/.asdf/shims/npm run filePitchingScrapper ~/Development/DWH/ballgame/data/HTML/TWL2024U13B.htm ../csv/stats_pitching_raw_twlu13b_2024.csv
/Users/tonper/.asdf/shims/npm run fileFieldingScrapper ~/Development/DWH/ballgame/data/HTML/TWL2024U13B.htm ../csv/stats_fielding_raw_twlu13b_2024.csv

printf "\n"
printf "#############\n"
printf "## GROUP A ##\n"
printf "#############\n"

/Users/tonper/.asdf/shims/npm run fileBattingScrapper ~/Development/DWH/ballgame/data/HTML/TWL2024U13A.htm ../csv/stats_batting_raw_twlu13a_2024.csv
/Users/tonper/.asdf/shims/npm run filePitchingScrapper ~/Development/DWH/ballgame/data/HTML/TWL2024U13A.htm ../csv/stats_pitching_raw_twlu13a_2024.csv
/Users/tonper/.asdf/shims/npm run fileFieldingScrapper ~/Development/DWH/ballgame/data/HTML/TWL2024U13A.htm ../csv/stats_fielding_raw_twlu13a_2024.csv



# printf "#########################\n"
# printf "#      Softball         #\n"
# printf "#########################\n"

# printf "\n"
# printf "##################\n"
# printf "##  La Gomera   ##\n"
# printf "##################\n"

# /Users/tonper/.asdf/shims/npm run fileBattingScrapper ~/Development/DWH/ballgame/data/HTML/CABLGS2024.htm ../csv/stats_batting_raw_cablgs_2024.csv
# /Users/tonper/.asdf/shims/npm run filePitchingScrapper ~/Development/DWH/ballgame/data/HTML/CABLGS2024.htm ../csv/stats_pitching_raw_cablgs_2024.csv
# /Users/tonper/.asdf/shims/npm run fileFieldingScrapper ~/Development/DWH/ballgame/data/HTML/CABLGS2024.htm ../csv/stats_fielding_raw_cablgs_2024.csv

# printf "\n"
# printf "##################\n"
# printf "## Gran Canaria ##\n"
# printf "##################\n"

# /Users/tonper/.asdf/shims/npm run fileBattingScrapper ~/Development/DWH/ballgame/data/HTML/CABGCS2024.htm ../csv/stats_batting_raw_cabgcs_2024.csv
# /Users/tonper/.asdf/shims/npm run filePitchingScrapper ~/Development/DWH/ballgame/data/HTML/CABGCS2024.htm ../csv/stats_pitching_raw_cabgcs_2024.csv
# /Users/tonper/.asdf/shims/npm run fileFieldingScrapper ~/Development/DWH/ballgame/data/HTML/CABGCS2024.htm ../csv/stats_fielding_raw_cabgcs_2024.csv

# printf "\n"
# printf "##################\n"
# printf "##   Tenerife   ##\n"
# printf "##################\n"

# /Users/tonper/.asdf/shims/npm run fileBattingScrapper ~/Development/DWH/ballgame/data/HTML/CABTFS2024.htm ../csv/stats_batting_raw_cabtfs_2024.csv
# /Users/tonper/.asdf/shims/npm run filePitchingScrapper ~/Development/DWH/ballgame/data/HTML/CABTFS2024.htm ../csv/stats_pitching_raw_cabtfs_2024.csv
# /Users/tonper/.asdf/shims/npm run fileFieldingScrapper ~/Development/DWH/ballgame/data/HTML/CABTFS2024.htm ../csv/stats_fielding_raw_cabtfs_2024.csv
