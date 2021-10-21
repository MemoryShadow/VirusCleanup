@echo off
type "配置文件.txt">目标.tmp
for /f "delims=" %%h in (目标.tmp) do (
set /a h+=1
echo %%h|find "["
if "!errorlevel!"=="0" call :DATA
)
del /s /q /f 目标.tmp>nul
pause
exit /b 0

:::DATA:::
:DATA

:::DATA:::