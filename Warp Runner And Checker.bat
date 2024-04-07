@echo off
setlocal enabledelayedexpansion
:start
for /f "tokens=2 delims=: " %%a in ('nslookup -q=A tgju.org ^| findstr /R "^Addresses: [0-9]*\.[0-9]*\.[0-9]*\.[0-9]*$"') do (
    set ip=%%a
    goto :break
)
:break
start /b warp-plus.exe -e !ip!:890
timeout /t 5
goto :loop
:start2
for /f "tokens=2 delims=: " %%a in ('nslookup -q=A zula.ir ^| findstr /R "^Addresses: [0-9]*\.[0-9]*\.[0-9]*\.[0-9]*$"') do (
    set ip=%%a
    goto :break
)
:break2
start /b warp-plus.exe -e !ip!:880
timeout /t 5
goto :loop2

:loop
curl --proxy 127.0.0.1:8086 --max-time 4 http://gstatic.com/generate_204
if %errorlevel% neq 0 (
    echo Connection failed
    taskkill /F /IM warp-plus.exe
    goto :start2
) else (
    echo Connection successful
)
timeout /t 20 /nobreak
goto :loop
:loop2
curl --proxy 127.0.0.1:8086 --max-time 4 http://gstatic.com/generate_204
if %errorlevel% neq 0 (
    echo Connection failed
    taskkill /F /IM warp-plus.exe
    goto :start
) else (
    echo Connection successful
)
timeout /t 20 /nobreak
goto :loop2
