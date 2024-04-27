:: Windows batch file
:: Git reset all local changes and then pull
:: the latest from Github repository
::
:: when       who         what
:: ---------- ----------- --------------------------------------------------------
:: 27/04/2024 Tony Pérez  initial

(C: && cd c:\ballgame\ballgameBI\ && git reset --hard && git.exe pull)
pause

:: to run this from a scheduled task with output
:: appended to a text file enter this in the task
:: action /C c:\ballgame\gitpull.bat >> c:\ballgame\gitpull.output.txt 2>&1
:: put the pause command in comments if scheduling this script.
