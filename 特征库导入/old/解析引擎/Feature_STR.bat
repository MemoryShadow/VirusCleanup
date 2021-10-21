@echo off
:Feature_STR
type ".\ÅäÖÃÎÄ¼þ.txt"|find "' ">>"Feature.tmp"
for /f "delims=' " %%f in (.\Feature.tmp) do echo %%f>>".\Feature.txt"
del /s /q /f "Feature.tmp">nul