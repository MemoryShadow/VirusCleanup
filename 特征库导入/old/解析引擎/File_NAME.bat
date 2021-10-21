@echo off
:File_NAME
type ".\ÅäÖÃÎÄ¼þ.txt"|find "; ">>"file.tmp"
for /f "delims=; " %%f in (.\file.tmp) do echo %%f>>".\File.txt"
del /s /q /f "file.tmp">nul