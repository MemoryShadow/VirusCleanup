@echo off
for /f %%a in (Data.txt) do (
for /f %%b in (�����ļ�.txt) do if "%%a"=="%%b" echo %%b
)
pause