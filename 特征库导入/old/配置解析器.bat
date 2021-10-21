@echo off
echo [DATA]-[Process_IM]
type ".\配置文件.txt"|find "# "
echo [DATA]-[File_NAME]
type ".\配置文件.txt"|find "; "
echo [DATE]-[Feature_STR]
type ".\配置文件.txt"|find "' "
echo.
set /p=以上为配置文件内容,<nul
pause