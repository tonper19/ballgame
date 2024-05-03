:: Windows batch file
:: Git pull latest changes from Github repository
::
:: when       who         what
:: ---------- ----------- --------------------------------------------------------
:: 03/04/2024
:: 27/04/2024 Tony Pérez  git stash: discard changes (and store a record of them)

(C: && cd c:\baseball\ballgameBI\ && git stash && git.exe pull)
pause

:: to run this from a scheduled task with output
:: appended to a text file enter this in the task
:: action /C c:\ballgame\gitpull.bat >> c:\ballgame\gitpull.output.txt 2>&1
:: put the pause command in comments if scheduling this script.
