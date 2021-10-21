@echo off
if not "%1"=="" (
if "%1"=="/?" goto help
) else %0 .tmp C:\

::
:run
IF NOT "%2"=="" (
DIR %2>nul
IF NOT "%ERRORLEVEL%"=="0" CALL :error 这不是一个有效的路径
IF not "%error%"=="" set error=&GOTO :eof
) else CALL :run %1 C:\&goto :eof
IF EXIST C:\%1.tmp del /s /q /f C:\%1.tmp
FOR /R %2 %%a IN (*%1) DO ECHO %%a>>C:\%1.tmp
if exist C:\%1.tmp (TYPE C:\%1.tmp&del C:\%1.tmp) else echo 在%2中没有找到名称中包含%1的文件
set ERRORLEVEL=0
GOTO :eof
::

::
:error
ECHO 错误：%1
set error=true
GOTO :eof
::

:help
ECHO 搜索文件。
ECHO.
ECHO SF [^/?] [filename] [drive:][path]
ECHO 	[/?]	获得帮助内容
ECHO 	[filename]
ECHO 		要搜索的文件名称
ECHO 	[drive:][path]
ECHO 		指定搜素路径，如果缺省将会对当前目录进行搜索
ECHO 	注意:如果你颠倒参数顺序，可能会进行错误的搜索
GOTO :eof
