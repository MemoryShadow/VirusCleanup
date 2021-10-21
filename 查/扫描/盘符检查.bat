@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for %%p in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
dir %%p:\>nul
if !errorlevel!==0 echo %%p>>"%temp%\pf.tmp"
)
ENDLOCAL
cls
type "%temp%\pf.tmp"
del /s /q /f "%temp%\pf.tmp">nul
pause