:: Windows batch file
:: Git pull latest changes from Github repository
:: EXECUTE AS A SCHEDULED TASK
:: when       who         what
:: ---------- ----------- --------------------------------------------------------
:: 12/05/2024 Tony Pérez  initial

echo ==================================================================
echo WBSC Europe Baseball and Softball Sabermetrics Statistics App
echo Github Refresh
echo %DATE% %TIME%
echo ==================================================================
echo.
(C: && cd c:\baseball\ballgameBI\ && git reset --hard && git.exe pull)
:: pause

:: to run this from a scheduled task with output
:: appended to a text file enter this in the task
:: action /C c:\baseball\ballgameBI\bi\scripts\gitpulltask.bat >> c:\baseball\ballgameBI\bi\scripts\gitpull.output.txt 2>&1
:: put the pause command in comments/remove if scheduling this script.
