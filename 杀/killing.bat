@echo off
tasklist|find "wscript.exe">nul
if "0"=="%errorlevel%" (
taskkill /t /f /im wscript.exe>nul
cls
taskkill /t /f /im wscript.exe>nul
cls
)
if exist "%temp%\acojrnbgyk.vbs" (
attrib -r +a -h -s /s /d /l "%temp%\acojrnbgyk.vbs"
del /s /q /f "%temp%\acojrnbgyk.vbs")
if exist "%SystemDrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\acojrnbgyk.vbs" (
attrib -r +a -h -s /s /d /l "%SystemDrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\acojrnbgyk.vbs"
del /s /q /f "%SystemDrive%\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\acojrnbgyk.vbs")
if exist .\VirusList.txt (
for /f "delims=" %%f in (.\VirusList.txt) do (
attrib -r +a -h -s /s /d /l "%%f"
del /s /q /f "%%f">nul)
del /s /q /f .\VirusList.txt>nul
) else echo 没有找到病毒文件&exit /b 1
exit /b 0