@echo off
:main
::exit /b 0

:::Process_IM:::
:Process_IM
type ".\配置文件.txt"|find "# ">>"Process.tmp"
for /f "delims=# " %%f in (.\Process.tmp) do echo %%f>>".\Process.txt"
del /s /q /f "Process.tmp">nul
:::Process_IM:::

:::File_NAME:::
:File_NAME
type ".\配置文件.txt"|find """ ">>"file.tmp"
for /f "delims="" " %%f in (.\file.tmp) do echo %%f>>".\File.txt"
del /s /q /f "file.tmp">nul
:::File_NAME:::

:::Feature_STR:::
:Feature_STR
type ".\配置文件.txt"|find "' ">>"Feature.tmp"
for /f "delims=' " %%f in (.\Feature.tmp) do echo %%f>>".\Feature.txt"
del /s /q /f "Feature.tmp">nul
:::Feature_STR:::

pause