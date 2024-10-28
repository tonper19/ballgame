
@cls
@echo off

echo ===================================================================================
echo WBSC Europe Baseball and Softball Sabermetrics Statistics App
echo Web scraping (Windows version)
echo %DATE%:%TIME%
echo ===================================================================================

echo #########################
echo #########################
echo ##        2024         ##
echo #########################
echo #########################

echo #########################
echo # Belgium Baseball      #
echo #########################


echo ########
echo ## D1 ##
echo ########

echo #### BE D1 2024
call npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/batting ../csv/stats_batting_raw_d1_2024.csv
call npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/pitching ../csv/stats_pitching_raw_d1_2024.csv
call npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d1/stats/general/all/fielding ../csv/stats_fielding_raw_d1_2024.csv

echo 
echo ########
echo ## D2 ##
echo ########

echo 
echo #### BE D2 2024
call npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d2/stats/general/all/batting ../csv/stats_batting_raw_d2_2024.csv
call npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d2/stats/general/all/pitching ../csv/stats_pitching_raw_d2_2024.csv
call npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d2/stats/general/all/fielding ../csv/stats_fielding_raw_d2_2024.csv

echo 
echo ########
echo ## D3 ##
echo ########

echo 
echo #### BE D3 2024
call npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d3/stats/general/all/batting ../csv/stats_batting_raw_d3_2024.csv
call npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d3/stats/general/all/pitching ../csv/stats_pitching_raw_d3_2024.csv
call npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d3/stats/general/all/fielding ../csv/stats_fielding_raw_d3_2024.csv

echo 
echo ########
echo ## D4 ##
echo ########

echo 
echo #### BE D4 2024
call npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d4/stats/general/all/batting ../csv/stats_batting_raw_d4_2024.csv
call npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d4/stats/general/all/pitching ../csv/stats_pitching_raw_d4_2024.csv
call npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-baseball-d4/stats/general/all/fielding ../csv/stats_fielding_raw_d4_2024.csv

echo 
echo ###########################
echo # Belgium Softball Ladies #
echo ###########################

echo 
echo ##########
echo ## SDD1 ##
echo ##########

echo 
echo #### BE SDD1 2024
call npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d1/stats/general/all/batting ../csv/stats_batting_raw_sdd1_2024.csv
call npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d1/stats/general/all/pitching ../csv/stats_pitching_raw_sdd1_2024.csv
call npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d1/stats/general/all/fielding ../csv/stats_fielding_raw_sdd1_2024.csv

echo 
echo ##########
echo ## SDD2 ##
echo ##########

echo 
echo #### BE SDD2 2024
call npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d2/stats/general/all/batting ../csv/stats_batting_raw_sdd2_2024.csv
call npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d2/stats/general/all/pitching ../csv/stats_pitching_raw_sdd2_2024.csv
call npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-softball-ladies-d2/stats/general/all/fielding ../csv/stats_fielding_raw_sdd2_2024.csv

echo 
echo ###########################
echo # Belgium Softball Men    #
echo ###########################

echo 
echo ##########
echo ## SMD1 ##
echo ##########

echo 
echo #### BE SMD1 2024
call npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-d1/stats/general/all/batting ../csv/stats_batting_raw_smd1_2024.csv
call npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-d1/stats/general/all/pitching ../csv/stats_pitching_raw_smd1_2024.csv
call npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-d1/stats/general/all/fielding ../csv/stats_fielding_raw_smd1_2024.csv

echo 
echo #############################
echo # Belgium Softball Reserves #
echo #############################

echo 
echo ##########
echo ## SRES ##
echo ##########

echo 
echo #### BE SRES 2024
call npm run webBattingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-reserves/stats/general/all/batting ../csv/stats_batting_raw_sres_2024.csv
call npm run webPitchingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-reserves/stats/general/all/pitching ../csv/stats_pitching_raw_sres_2024.csv
call npm run webFieldingScrapper https://www.baseballsoftball.be/en/events/2024-softball-men-reserves/stats/general/all/fielding ../csv/stats_fielding_raw_sres_2024.csv

echo #########################
echo # Italy Baseball        #
echo #########################

echo 
echo #############
echo ## Serie A ##
echo #############

echo 
echo #### IT A 2024
call npm run webBattingScrapper https://www.fibs.it/en/events/2024-serie-a-baseball/stats/general/all/batting ../csv/stats_batting_raw_seriea_2024.csv
call npm run webPitchingScrapper https://www.fibs.it/en/events/2024-serie-a-baseball/stats/general/all/pitching ../csv/stats_pitching_raw_seriea_2024.csv
call npm run webFieldingScrapper https://www.fibs.it/en/events/2024-serie-a-baseball/stats/general/all/fielding ../csv/stats_fielding_raw_seriea_2024.csv

echo #########################
echo # Austria Baseball      #
echo #########################

echo 
echo #########################
echo ## Baseball Bundesliga ##
echo #########################

echo 
echo #### AT ABDL 2024
call npm run webBattingScrapper https://www.baseballsoftball.at/de/events/baseball-bundesliga-2024/stats/general/all/batting ../csv/stats_batting_raw_abdl_2024.csv
call npm run webPitchingScrapper https://www.baseballsoftball.at/de/events/baseball-bundesliga-2024/stats/general/all/pitching ../csv/stats_pitching_raw_abdl_2024.csv
call npm run webFieldingScrapper https://www.baseballsoftball.at/de/events/baseball-bundesliga-2024/stats/general/all/fielding ../csv/stats_fielding_raw_abdl_2024.csv

echo #########################
echo # Netherlands Baseball  #
echo #########################

echo 
echo #########################
echo ## Honkbal Hoofklasse  ##
echo #########################

echo 
echo #### NL HK 2024
call npm run webBattingScrapper https://stats.knbsbstats.nl/en/events/2024-lucky-day-hoofdklasse-honkbal/stats/general/all/batting ../csv/stats_batting_raw_hk_2024.csv
call npm run webPitchingScrapper https://stats.knbsbstats.nl/en/events/2024-lucky-day-hoofdklasse-honkbal/stats/general/all/pitching ../csv/stats_pitching_raw_hk_2024.csv
call npm run webFieldingScrapper https://stats.knbsbstats.nl/en/events/2024-lucky-day-hoofdklasse-honkbal/stats/general/all/fielding ../csv/stats_fielding_raw_hk_2024.csv

echo #########################
echo # Spain Baseball        #
echo #########################

echo 
echo #############################
echo ## Spanish Baseball League ##
echo #############################

echo 
echo #### ES SBL 2024
call npm run webBattingScrapper https://www.rfebs.es/es/events/2024-spanish-baseball-league/stats/general/all/batting ../csv/stats_batting_raw_sbl_2024.csv
call npm run webPitchingScrapper https://www.rfebs.es/es/events/2024-spanish-baseball-league/stats/general/all/pitching ../csv/stats_pitching_raw_sbl_2024.csv
call npm run webFieldingScrapper https://www.rfebs.es/es/events/2024-spanish-baseball-league/stats/general/all/fielding ../csv/stats_fielding_raw_sbl_2024.csv

echo #########################
echo # Spain Softball        #
echo #########################

echo 
echo ####################################
echo ## Spanish Softball League Ladies ##
echo ####################################

echo 
echo #### ES SSL 2024
call npm run webBattingScrapper https://www.rfebs.es/es/events/2024-spanish-softball-league/stats/general/all/batting ../csv/stats_batting_raw_ssl_2024.csv
call npm run webPitchingScrapper https://www.rfebs.es/es/events/2024-spanish-softball-league/stats/general/all/pitching ../csv/stats_pitching_raw_ssl_2024.csv
call npm run webFieldingScrapper https://www.rfebs.es/es/events/2024-spanish-softball-league/stats/general/all/fielding ../csv/stats_fielding_raw_ssl_2024.csv

echo #########################
echo # Netherlands Softball  #
echo #########################

echo 
echo #############################
echo ## Softbal Hoofdklasse     ##
echo #############################

echo 
echo #### NL SHK 2024
call npm run webBattingScrapper https://stats.knbsbstats.nl/en/events/2024-hoofdklasse-softbal/stats/general/all/batting ../csv/stats_batting_raw_shk_2024.csv
call npm run webPitchingScrapper https://stats.knbsbstats.nl/en/events/2024-hoofdklasse-softbal/stats/general/all/pitching ../csv/stats_pitching_raw_shk_2024.csv
call npm run webFieldingScrapper https://stats.knbsbstats.nl/en/events/2024-hoofdklasse-softbal/stats/general/all/fielding ../csv/stats_fielding_raw_shk_2024.csv

echo ###########################
echo # United Kingdom Baseball #
echo ###########################

echo 
echo ##############################
echo ## National Baseball League ##
echo ##############################

echo 
echo #### GB NBL 2024
call npm run webBattingScrapper https://stats.britishbaseball.org.uk/en/events/2024-nbl/stats/general/all/batting ../csv/stats_batting_raw_nbl_2024.csv
call npm run webPitchingScrapper https://stats.britishbaseball.org.uk/en/events/2024-nbl/stats/general/all/pitching ../csv/stats_pitching_raw_nbl_2024.csv
call npm run webFieldingScrapper https://stats.britishbaseball.org.uk/en/events/2024-nbl/stats/general/all/fielding ../csv/stats_fielding_raw_nbl_2024.csv


echo 
echo 
echo #########################
echo # FINISH                #
echo #########################
