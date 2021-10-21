@echo off
for /f %%a in (Data.txt) do (
for /f %%b in (еДжцнд╪Ч.txt) do if "%%a"=="%%b" echo %%b
)
pause