@echo off
title ����ʱ��ʾ
set /p h=ʱ��
set /p m=�֣�
set /p s=�룺
set /a hour=%h%*60*60,min=%m%*60,sec=%s%
set /a result=%hour%+%min%+%sec%
echo ����ǣ�%result%
set max_seconds=%result%
:count
cls&echo ���� %max_seconds% �������!

if %max_seconds%==0 goto work

set last_time=%time:~-5,-3%
:loop
set current_time=%time:~-5,-3%
if %last_time%==%current_time% (goto loop) else (set last_time=%time:~-5,-3%)
set /a max_seconds-=1
goto count

:work
echo ����ʱ������ִ�����������
start F:\Program Files\Adobe\Adobe After Effects CS6\Support Files\AfterFX.exe
pause