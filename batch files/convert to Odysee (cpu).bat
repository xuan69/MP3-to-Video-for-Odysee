::https://github.com/xuan69/MP3-to-Video-for-Odysee
@echo off
setlocal enabledelayedexpansion

rem Set the image file name
set image=background.jpg

rem Loop over all mp3 files in the directory
for %%f in (*.mp3) do (
    rem Get the base file name without the extension
    set "filename=%%~nf"
    
    rem Run the ffmpeg command with the current mp3 file
    ffmpeg -loop 1 -i "!image!" -i "%%f" -c:v libx264 -crf 21 -preset faster -pix_fmt yuv420p -maxrate 5000K -bufsize 5000K -vf "scale=if(gte(iw\,ih)\,min(1920\,iw)\,-2):if(lt(iw\,ih)\,min(1920\,ih)\,-2)" -movflags +faststart -c:a aac -b:a 160k -shortest "!filename!.mp4"
)

endlocal 
