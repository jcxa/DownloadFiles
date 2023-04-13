# DownloadFiles
PowerShell script to download files from a list

This is a PowerShell script that downloads files from a list of filenames.

It takes 2 arguments: 
- downloadList -> the text list of files (one file per each line)
- webSite -> the url of the web site where to download the files

The script downloads the files to a new folder named 'downloadedFiles' created inside the current folder where the script is.

Example:
.\downloadFiles.ps1 -downloadList .\list.txt -webSite "https://archive.org/download/dreamcast.-cdi.-roms.-pack-vlc/"

The file list.txt should have one filename per line.

Example of the contents of the file list.txt:
Dinosaur, Disney's (USA) (English only)[DCRES].mp4
Striker Pro 2000 (USA)[ECKO].mp4
NBA 2K (USA) (Sega Sports)[DCRES].mp4
Sega Swirl (USA)[DaBOM].cdi
Toy Story 2 - Buzz Lightyear to the Rescue! (USA)[DCRES].mp4
