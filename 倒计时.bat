@echo off
title 倒计时显示
set /p h=时：
set /p m=分：
set /p s=秒：
set /a hour=%h%*60*60,min=%m%*60,sec=%s%
set /a result=%hour%+%min%+%sec%
echo 结果是：%result%
set max_seconds=%result%
:count
cls&echo 设置 %max_seconds% 秒后启动!

if %max_seconds%==0 goto work

set last_time=%time:~-5,-3%
:loop
set current_time=%time:~-5,-3%
if %last_time%==%current_time% (goto loop) else (set last_time=%time:~-5,-3%)
set /a max_seconds-=1
goto count

:work
echo 倒计时结束，执行下面的任务
start F:\Program Files\Adobe\Adobe After Effects CS6\Support Files\AfterFX.exe
pause