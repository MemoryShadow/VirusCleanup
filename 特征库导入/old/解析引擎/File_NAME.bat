@echo off
:File_NAME
type ".\�����ļ�.txt"|find "; ">>"file.tmp"
for /f "delims=; " %%f in (.\file.tmp) do echo %%f>>".\File.txt"
del /s /q /f "file.tmp">nul