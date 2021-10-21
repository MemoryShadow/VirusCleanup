@echo off
cd /d %cd%
set>.\yuan.set
echo 备份原配置....
::创建命令行工具
(echo @for ^/f ^"usebackq delims=^" %%%%s in ^(^"%%cd%%^\yuan.set^"^) do @set %%%%s)>.\oldset.bat
cls
title 环境配置
:lj
echo 开启路径一体化?[y,n]
set /p xx=:
if "y"=="%xx:~,1%" call :Path&goto lj-e
if "y"=="%xx:~,1%" call :Path&goto lj-e
:lj-e
set xx=
cls
:bd
echo 开启计算机环境本地模拟?[y,n]
set /p xx=:
if "y"=="%xx:~,1%" call :setting&goto bd-e
if "Y"=="%xx:~,1%" call :setting&goto bd-e
:bd-e
set xx=
cls
if not "%errorlevel%"=="0" del /s /q /f ".\Path.set" ".\set1">nul&exit /b 1
title 待命....
IF "%1"=="" (call :y cmd) else call :y %1
rd /s /q "%cd%\setting"
title 报告
echo -------------------------------------------------------------------------------
echo 环境运行开始时间:[%olddate%-%oldtime%]
set olddate=&set oldtime=
echo 环境运行结束时间:[%enddate%-%endtime%]
set enddate=&set endtime=
echo 返回值:%return%
set return=
if exist set2 del /s /q /f set2>nul
set>set2
fc set1 set2
del /s /q /f "%old%\set1" "%old%\set2" "%old%\yuan.set" "%old%\oldset.bat">nul
echo -------------------------------------------------------------------------------
pause
exit /b 0

:y
::采集数据
if exist set1 del /s /q /f set1>nul
set>set1
set olddate=%date%
set oldtime=%time%
START /w "环境已就绪" call cmd /c "call %1"
::返回数据
set enddate=%date%
set endtime=%time%
set return=%errorlevel%
goto :eof

:Path
::将此目录树数据都加入变量path达到路径一体化
>.\Path.set set /p=Path=%Path%<nul
if not "%Path:~-1%"==";" >>.\Path.set set /p=;<nul
for /r "%cd%" %%d in (^") do @echo ^"%%~d>>.\path.tmp
for /f "delims=" %%d in (.\path.tmp) do >>.\Path.set set /p=%%~d;<nul
set h=0
if exist .\path.tmp for /f "delims=" %%a in (.\path.tmp) do set /a h+=1
if exist .\path.tmp del /s /q /f .\path.tmp>nul
if /i %h% GTR 200 set h=&echo msgbox "工程过大，最大为200个目录",,"警告">"%temp%\Error.vbs"&call "%temp%\Error.vbs"&del /s /q /f "%temp%\Error.vbs">nul&del /s /q /f ".\Path.set">nul&set h=&exit /b 1
set h=
for /f "delims=" %%p in (.\Path.set) do @set %%p
del /s /q /f ".\Path.set">nul
exit /b 0

:setting
::创建本地目录，并且绑定此目录
md ".\setting\%SystemDrive:~,1%">nul
set SystemDrive=%cd%\setting\%SystemDrive:~,1%
md ".\setting\ProgramData">nul
set ALLUSERSPROFILE=%cd%\setting\ProgramData
set ProgramData=%cd%\setting\ProgramData
md ".\setting\AppData\Roaming">nul
set APPDATA=%cd%\setting\AppData\Roaming
md ".\setting\Program Files\Common Files">nul
set ProgramFiles=%cd%\setting\Program Files
set CommonProgramFiles=%cd%\setting\Program Files\Common Files
md ".\setting\AppData\Local">nul
set LOCALAPPDATA=%cd%\setting\AppData\Local
md ".\setting\Public">nul
set PUBLIC=%cd%\setting\Public
md ".\setting\Windows">nul
set windir=%cd%\setting\Windows
set SystemRoot=%cd%\setting\Windows
md ".\setting\Temp">nul
set TEMP=%cd%\setting\Temp
set TMP=%cd%\setting\Temp
md ".\setting\%username%">nul
set USERPROFILE=%cd%\setting\%username%
set HOMEPATH=%cd%\setting\%username%
set old=%cd%