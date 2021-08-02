This directory contains two scripts for downloading audio files from youtube playlists, and videos.

- Run Playlist_Downloader and enter a Youtube playlist URL to download all items in the playlist.
- Run Song_Downloader and enter a Youtube video URL to download the item.

The results will be stored in the Downloads folder.

You will probably have to right-click 'cleannames.ps1' and go to properties and unblock the file.

Debugging:
If the program gets stuck on a song in the gain change process, press 'crtl+c' followed by 'n'.

If there are .jpg or .webm files in the Downloads folder, it means something went wrong during downloading
and the song in question needs to be manually redownloaded.

If there are .mp4 files in the Downloads folder, it means something went wrong during the volume
normalizing process. They can be deleted and the normalizing can be redone.
This is done by rerunning the script or by entering the following in a command prompt:
powershell -executionpolicy remotesigned -File "./cleannames.ps1"