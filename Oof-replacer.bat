::
:: Script created by Anfri: twitter @GorbageAcquired
:: Distribute this script as far and wide as you wish!
:: https://github.com/AnfriH/Oof-Replacer
::
@ECHO OFF

::download link to oof audio
set DOWNLOAD_PATH="https://static.wikia.nocookie.net/roblox/images/6/61/Uuhhh.ogg"
set SOUND_DIR="\content\sounds"
::navigate to roblox dir
cd /d %LocalAppData%
cd Roblox\Versions

::download oof audio into dir
echo Downloading oof audio file from %DOWNLOAD_PATH%
bitsadmin.exe /transfer "DownloadOof" %DOWNLOAD_PATH% "%__CD__%\ouch.ogg" > nul
echo File successfully downloaded!

::for each folder in the versions dir
echo Copying oof into game directories
FOR /D %%G in (%__CD__%*) do (
    ::if the sounds folder is present within a subfolder
    IF EXIST "%%G%SOUND_DIR%" (
        ::replace oof sound in dir
        echo Replacing "ouch.ogg" in %%G%SOUND_DIR%
        del "%%G%SOUND_DIR%\ouch.ogg"
        xcopy /f "%__CD__%\ouch.ogg" "%%G%SOUND_DIR%" > del
    )
)
::delete downloaded file
echo Performing Cleanup
del "%cd%\ouch.ogg"
echo Oof sound has been successfully replaced!
PAUSE