@echo off
for /f %%f in (.\DATA.txt) do (
set /p=[DATA]-<nul
type ".\ÅäÖÃÎÄ¼þ.txt"|find "%%f"
if not "%errorlevel%"=="0" echo 0
)
pause