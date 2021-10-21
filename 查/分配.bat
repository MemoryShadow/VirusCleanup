@echo off
echo 检查环境
call .\列出有效盘符.bat
pause
copy %SystemDrive%\pf.tmp .\DriveList>nul&&del /s /q /f %SystemDrive%\pf.tmp>nul
for /f %%a in (.\DriveList) do (
for /f %%b in (.\SList.txt) do (
call .\搜索\ss %%b %%a:\>>".\tmp"))
pause