@echo off
cd %~dp0
if "%PROCESSOR_ARCHITECTURE%"=="x86" copy npf_x86.sys %SystemRoot%\system32\drivers\npf.sys
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" copy npf_x64.sys %SystemRoot%\system32\drivers\npf.sys
if exist %SystemRoot%\system32\drivers\npf.sys (echo copy success!) else (echo copy error!)
sc create npf binPath= system32\drivers\npf.sys type= kernel start= demand error= normal tag= no DisplayName= "NetGroup Packet Filter Driver"
sc start npf
