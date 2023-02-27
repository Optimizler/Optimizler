@echo off
color 0a
title Optimizler
ipconfig /flushdns
cls
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /d 0 /f /reg:64
:start
cls
echo 1. All Optimizations.
echo 2. Power Plan.
echo 3. System Restore.
echo.
choice /c 123 /m ">:"
:1
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
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /d 0 /f /reg:64
bcdedit /deletevalue increaseuserva
reg add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v CpuPriorityClass /t Reg_DWORD /d "4" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v IoPriority /t Reg_DWORD /d "3" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
reg delete "HKLM\System\CurrentControlSet\Control\Session Manager" /v "HeapDeCommitFreeBlockThreshold" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabledDefault" /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /f
powershell -NoProfile -NonInteractive -Command ^
Enable-NetAdapterQos -Name "*";^
Disable-NetAdapterPowerManagement -Name "*";^
Disable-NetAdapterIPsecOffload -Name "*";^
Set-NetTCPSetting -SettingName "*" -MemoryPressureProtection Disabled -InitialCongestionWindow 10 -ErrorAction SilentlyContinue
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxConnectRetransmissions" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DelayedAckFrequency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DelayedAckTicks" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "CongestionAlgorithm" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MultihopSets" /t REG_DWORD /d "15" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d "50" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SizReqBuf" /t REG_DWORD /d "17424" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "Size" /t REG_DWORD /d "3" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\QoS" /v "Do not use NLA" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeCacheTime" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeSOACacheTime" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NetFailureCacheTime" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrDisableNagleentControlSet\Services\AFD\Parameters" /v "DoNotHoldNicBuffers" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
for /f "tokens=3*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards" /f "ServiceName" /s ^|findstr /i /l "ServiceName"') do (
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t Reg_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t Reg_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t Reg_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpInitialRTT" /d "300" /t REG_DWORD /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "UseZeroBroadcast" /d "0" /t REG_DWORD /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "DeadGWDetectDefault" /d "1" /t REG_DWORD /f
cls
goto end
:2
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
goto end
:3
systempropertiesprotection.exe
:end
cls
echo Finished, Exiting...
timeout /t 2 /nobreak >nul
cls
exit