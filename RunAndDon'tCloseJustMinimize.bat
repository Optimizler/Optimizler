@echo off
:top
ipconfig /flushdns
timeout /t 2 /nobreak >nul
cls
goto :top