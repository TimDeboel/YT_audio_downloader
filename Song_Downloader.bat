@echo off
:start
cls
echo ------------------------------------------------------------------------
set /p SongUrl="Enter a Youtube URL: "
echo ------------------------------------------------------------------------
youtube-dl -f bestaudio[ext=m4a] -4 --ignore-errors --socket-timeout 120 --no-playlist --embed-thumbnail --add-metadata -o "./Downloads/Songs/%%(title)s.%%(ext)s" %SongUrl%
echo ------------------------------------------------------------------------
echo Files downloaded
echo.
youtube-dl --rm-cache-dir
echo Cache cleaned
echo.
powershell -executionpolicy remotesigned -File "./cleannames.ps1"
echo.
FOR /f "tokens=*" %%G IN ('dir "./Downloads/Songs" /b /s') DO (
    IF "%%~xG" == ".m4a" (aacgain -q -r -c -d 6 "%%~fG")
)
echo ------------------------------------------------------------------------
goto start