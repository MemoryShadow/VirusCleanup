@echo off
set OldVersion=2.9.9
mode con cols=80 lines=25
title �������....
ping -n 1 www.baidu.com>nul
if not "%errorlevel%"=="0" echo ��������ʧ��,����������˳�&pause>nul&exit /b 1
title �������ӷ�����....
ping -n 1 jsker.net3v.net>nul
if not "%errorlevel%"=="0" echo ���ӷ�����ʧ��,����������˳�&pause>nul&exit /b 1
title ���ڼ�����....
call :Download http://jsker.net3v.net/run/version/Virus_killing/version.html .\version.txt
for /f "tokens=1,2,3* delims=." %%a in (.\version.txt) do (
set a=%%a
set b=%%b
set c=%%c
)
set YunVersion=%a%.%b%.%c%
if exist .\version.txt del /s /q /f .\version.txt>nul
set a=&set b=&set c=
title ���
if /i %YunVersion:~,1% GTR %OldVersion:~,1% goto New
if /i %YunVersion:~2,1% GTR %OldVersion:~2,1% goto New
if /i %YunVersion:~4,1% GTR %OldVersion:~4,1% goto New
echo ��ʹ�õİ汾�����µ�,����������˳��˽���
set YunVersion=
pause>nul
exit /b 0
:New
echo �����°汾������ȥ���أ�[y,n]
chicoe /n /m :>nul
cls
if "%errorlevel%"=="9009" goto set
if "%errorlevel%"=="1" goto IE
if "%errorlevel%"=="2" exit /b 2
if "%errorlevel%"=="255" goto set
:IE
start explorer http://jsker.net3v.net/pillar/product/Virus_killing.html
goto end
:set
echo �����°汾������ȥ���أ�[y,n] 
set /p xx=:
cls
if "%xx%"=="y" goto IE
if "%xx%"=="Y" goto IE
if "%xx%"=="n" exit /b 2
if "%xx%"=="N" exit /b 2
echo û�����ѡ��
echo -------------------------------------------------------------------------------
goto set
:end
exit /b 1

::Download::
:Download
(echo Set xPost = CreateObject^("Microsoft.XMLHTTP"^)
echo xPost.Open "GET","%1",0
echo xPost.Send^(^)
echo Set sGet = CreateObject^(^"ADODB.Stream^"^)
echo sGet.Mode = 3
echo sGet.Type = 1
echo sGet.Open^(^)
echo sGet.Write^(xPost.responseBody^)
echo sGet.SaveToFile "%2",2 )>downit.vbs
call downit.vbs
del downit.vbs
::