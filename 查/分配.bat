@echo off
echo ��黷��
call .\�г���Ч�̷�.bat
pause
copy %SystemDrive%\pf.tmp .\DriveList>nul&&del /s /q /f %SystemDrive%\pf.tmp>nul
for /f %%a in (.\DriveList) do (
for /f %%b in (.\SList.txt) do (
call .\����\ss %%b %%a:\>>".\tmp"))
pause