@echo off
:Process_IM
type ".\ÅäÖÃÎÄ¼þ.txt"|find "# ">>"Process.tmp"
for /f "delims=# " %%f in (.\Process.tmp) do echo %%f>>".\Process.txt"
del /s /q /f "Process.tmp">nul