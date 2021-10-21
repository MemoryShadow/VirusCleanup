@echo off
set OldVersion=2.9.9
mode con cols=80 lines=25
title 检查网络....
ping -n 1 www.baidu.com>nul
if not "%errorlevel%"=="0" echo 连接网络失败,按下任意键退出&pause>nul&exit /b 1
title 正在连接服务器....
ping -n 1 jsker.net3v.net>nul
if not "%errorlevel%"=="0" echo 连接服务器失败,按下任意键退出&pause>nul&exit /b 1
title 正在检查更新....
call :Download http://jsker.net3v.net/run/version/Virus_killing/version.html .\version.txt
for /f "tokens=1,2,3* delims=." %%a in (.\version.txt) do (
set a=%%a
set b=%%b
set c=%%c
)
set YunVersion=%a%.%b%.%c%
if exist .\version.txt del /s /q /f .\version.txt>nul
set a=&set b=&set c=
title 完成
if /i %YunVersion:~,1% GTR %OldVersion:~,1% goto New
if /i %YunVersion:~2,1% GTR %OldVersion:~2,1% goto New
if /i %YunVersion:~4,1% GTR %OldVersion:~4,1% goto New
echo 您使用的版本是最新的,按下任意键退出此界面
set YunVersion=
pause>nul
exit /b 0
:New
echo 发现新版本，现在去下载？[y,n]
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
echo 发现新版本，现在去下载？[y,n] 
set /p xx=:
cls
if "%xx%"=="y" goto IE
if "%xx%"=="Y" goto IE
if "%xx%"=="n" exit /b 2
if "%xx%"=="N" exit /b 2
echo 没有这个选项
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