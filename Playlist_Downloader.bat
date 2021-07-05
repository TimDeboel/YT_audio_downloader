@echo off
echo ------------------------------------------------------------------------
set /p PlaylistUrl=Enter a Youtube playlist URL: 
echo ------------------------------------------------------------------------
set /p PlaylistStart="Playlist start: "
set /a PlaylistStart+=0
set /p PlaylistEnd="Playlist end: "
set /a PlaylistEnd+=0
echo ------------------------------------------------------------------------
youtube-dl -f bestaudio[ext=m4a] -4 --socket-timeout 120 --ignore-errors --yes-playlist --embed-thumbnail --add-metadata --playlist-start %PlaylistStart% --playlist-end %PlaylistEnd% -o "./Downloads/%%(playlist)s/%%(title)s.%%(ext)s" %PlaylistUrl%
echo ------------------------------------------------------------------------
echo Files downloaded
echo.
youtube-dl --rm-cache-dir
echo Cache cleaned
echo.
powershell -executionpolicy remotesigned -File "./cleannames.ps1"
echo.
FOR /f "tokens=*" %%G IN ('dir "./Downloads" /b /s') DO (
    IF "%%~xG" == ".m4a" (aacgain -q -r -c "%%~fG")
)
echo ------------------------------------------------------------------------
echo Finished
echo ------------------------------------------------------------------------
pause
exit