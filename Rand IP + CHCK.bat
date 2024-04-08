@echo off
setlocal enabledelayedexpansion
:start
set /a r=%random% %% 256
set ip=162.159.192.!r!
    goto :break
)
:break
start /b warp-plus.exe -e !ip!:880
timeout /t 5
goto :loop
:start2
set /a r=%random% %% 256
set ip=162.159.192.!r!
    goto :break2
)
:break2
start /b warp-plus.exe -e !ip!:8854
timeout /t 5
goto :loop2
:start3
set /a r=%random% %% 256
set ip=162.159.192.!r!
    goto :break3
)
:break3
start /b warp-plus.exe -e !ip!:946
timeout /t 5
goto :loop3
:loop
curl --proxy 127.0.0.1:8086 --max-time 7 http://gstatic.com/generate_204
if %errorlevel% neq 0 (
    echo Connection failed
    taskkill /F /IM warp-plus.exe
    goto :start2
) else (
    echo Connection successful
)
timeout /t 25 /nobreak
goto :loop
:loop2
curl --proxy 127.0.0.1:8086 --max-time 7 http://gstatic.com/generate_204
if %errorlevel% neq 0 (
    echo Connection failed
    taskkill /F /IM warp-plus.exe
    goto :start3
) else (
    echo Connection successful
)
timeout /t 25 /nobreak
goto :loop2
:loop3
curl --proxy 127.0.0.1:8086 --max-time 7 http://gstatic.com/generate_204
if %errorlevel% neq 0 (
    echo Connection failed
    taskkill /F /IM warp-plus.exe
    goto :start
) else (
    echo Connection successful
)
timeout /t 25 /nobreak
goto :loop3
