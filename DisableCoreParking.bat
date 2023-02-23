@echo off
title Disabling Core Parking...
bcdedit /deletevalue increaseuserva
color 0b
cd /
cd %userprofile%\Desktop
md "GOHERE"
cd "GOHERE"
type nul > If2CoresLaunchThis.bat
echo bcdedit /set numproc 2 > If2CoresLaunchThis.bat
type nul > If4CoresLaunchThis.bat
echo bcdedit /set numproc 4 > If4CoresLaunchThis.bat
type nul > If6CoresLaunchThis.bat
echo bcdedit /set numproc 6 > If6CoresLaunchThis.bat
type nul > If8CoresLaunchThis.bat
echo bcdedit /set numproc 8 > If8CoresLaunchThis.bat
type nul > If12CoresLaunchThis.bat
echo bcdedit /set numproc 12 > If12CoresLaunchThis.bat
type nul > If16CoresLaunchThis.bat
echo bcdedit /set numproc 16 > If16CoresLaunchThis.bat
type nul > If24CoresLaunchThis.bat
echo bcdedit /set numproc 24 > If24CoresLaunchThis.bat
type nul > If32CoresLaunchThis.bat
echo bcdedit /set numproc 32 > If32CoresLaunchThis.bat
cls
type nul > README.txt
echo Launch As Administrator. > README.txt
cls
echo Opening the files in your Desktop...
timeout /t 3 /nobreak >nul
cls
explorer %userprofile%\Desktop\GOHERE\
timeout /t 2 /nobreak >nul
exit