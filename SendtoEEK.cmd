@echo off
echo;
echo Send to EEK  ver.2020.02.07.01
echo;
echo;
set /p input="Input y to update malware signature, or input n to skip:"
if "%input%"=="n" goto Runscan 
if not "%input%"=="n" goto Runupdate

:Runupdate
echo;
echo;
echo [UPDATE] Updating malware signatures......
a2cmd.exe /update
echo [UPDATE] Update completed!
goto Runscan
exit



:Runscan
echo;
echo;
echo [SCANNER] Scanning files......
a2cmd.exe /f=%1 /pup /archive /ntfs /dda /log="D:\EEK_Log\ScanResult.log"
if %errorlevel% equ 0 echo [SCANNER] Completed! No infections were found!
if %errorlevel% equ 1 echo [SCANNER] Completed! Infections were found!
echo;
echo;
set /p showresult="Input y to show logfile, or input n to skip:"
echo;
echo;
if "%showresult%"=="y" type "D:\EEK_Log\ScanResult.log"
echo;
echo;
pause
exit
