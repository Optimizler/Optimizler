@echo off
bcdedit /deletevalue increaseuserva
title Make a restore point before running.
color 0c
cls
echo Make a restore point before running... (Press any key 3 times to run.)
echo.
echo.
echo.
pause >nul
cls
echo 1
pause >nul
echo 2
pause >nul
echo 3. Running...
timeout /t 2 /nobreak >nul
cls
title Optimizler V0.01 (The Start...)
ipconfig /flushdns
ipconfig /renew
ipconfig /registerdns
ipconfig /release
ipconfig /flushdns
netsh winsock reset
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /d 0 /f /reg:64
cd /
del *.log /a /s /q /f
del *.tmp /a /s /q /f
del *.pf /a /s /q /f
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg -setactive f53a6f50-f0a7-4d3b-87b1-97eaf85ed8d3
powercfg -h off
bcdedit /set increaseuserva 8000
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /f /reg:64
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f /reg:64
net stop "wuauserv"
net stop "UsoSvc"
cd %SYSTEMROOT%\SoftwareDistribution
del * /a /s /q /f
takeown /f "%SYSTEMROOT%\SoftwareDistribution" /r /d y
rd /s /q "%SYSTEMROOT%\SoftwareDistribution"
netsh int tcp set global autotuninglevel=normal
cls
netsh interface 6to4 set state disabled
cls
netsh int isatap set state disable
cls
netsh int tcp set global timestamps=disabled
cls
netsh int tcp set heuristics disabled
cls
netsh int tcp set global chimney=disabled
cls
netsh int tcp set global ecncapability=disabled
cls
netsh int tcp set global rsc=disabled
cls
netsh int tcp set global nonsackrttresiliency=disabled
cls
netsh int tcp set security mpp=disabled
cls
netsh int tcp set security profiles=disabled
cls
netsh int ip set global icmpredirects=disabled
cls
netsh int tcp set security mpp=disabled profiles=disabled
cls
netsh int ip set global multicastforwarding=disabled
cls
netsh int tcp set supplemental internet congestionprovider=ctcp
cls
netsh interface teredo set state disabled
cls
netsh int isatap set state disable
cls
netsh int ip set global taskoffload=disabled
cls
netsh int ip set global neighborcachelimit=4096
cls
netsh int tcp set global dca=enabled
cls
netsh winsock reset
cls
netsh int tcp set global netdma=enabled
cls
PowerShell Disable-NetAdapterLso -Name "*"
cls
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterPowerManagement -Name $adapter.Name -ErrorAction SilentlyContinue}"
cls
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterLso -Name $adapter.Name -ErrorAction SilentlyContinue}"
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "1" /f
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "8760" /f
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
cls
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t Reg_DWORD /d "4" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t Reg_DWORD /d "3" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "ffffffff" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
title Optimizler doing things. :)
cls
ipconfig /flushdns
ipconfig /registerdns
cls
echo If the DISM command always stays at 0% then just close this window since It's just a waste of time...
timeout /t 10 /nobreak >nul
sfc /scannow
cls
dism /online /cleanup-image /restorehealth
cls
echo Done optimizing, press any key 5 times to restart so that you can finish applying the changes...
echo.
echo ----------------------------------------------------
echo.
echo https://github.com/Optimizler/Optimizler
echo.
pause >nul
echo 1
pause >nul
cls
echo 2
pause >nul
cls
echo 3
pause >nul
cls
echo 4
pause >nul
title Restarting...
cls
echo 5! Restarting...
timeout /t 3 /nobreak >nul
shutdown -r -t 10 -c "Applying Changes..."