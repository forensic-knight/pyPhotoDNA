@echo off

echo.
echo Welcome to the pyPhotoDNA installer.
echo The script will now setup a pyPhotoDNA environment for you. Please be patient.

echo.
echo Downloading FTK (3.4GB, might take a while)...
bitsadmin /transfer "Downloading FTK" /priority HIGH http://ad-iso.s3.amazonaws.com/AD_FTK_6.3.0.iso %cd%\AD_FTK_6.3.0.iso > nul

echo.
echo Extracting PhotoDNAx64.dll.
powershell.exe -Command "&{$beforeMount = (Get-Volume).DriveLetter; $mountResult = Mount-DiskImage %cd%\\AD_FTK_6.3.0.iso; $afterMount = (Get-Volume).DriveLetter; $setupPath = \"$(($afterMount -join '').replace(($beforeMount -join ''), '')):\FTK\FTK\x64\{8A89F096-3685-47E2-AFAE-48F7E3FC5A05}\Data1.cab\"; $finalString = expand $setupPath /f:photodnax64.1.72.dll %cd%; Get-Volume ($setupPath.Replace(\":\FTK\FTK\x64\{8A89F096-3685-47E2-AFAE-48F7E3FC5A05}\Data1.cab\", \"\")) | Get-DiskImage | Dismount-DiskImage }" > nul
del AD_FTK_6.3.0.iso
rename photodnax64.1.72.dll PhotoDNAx64.dll

echo.
echo.
echo Installation complete!
echo _____________________________
echo.
echo To generate a PhotoDNA hash, run generateHashes.py.
pause