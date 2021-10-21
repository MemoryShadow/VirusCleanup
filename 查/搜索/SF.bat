@ECHO OFF
SET error=

::
:main
REM ------------------------------------------- 判断是否输入参数
IF NOT "%1"=="" (
REM ------------------------------------------- 判断输入的参数是否为/?，如果是，跳转到help模块
IF "%1"=="/?" GOTO help
REM ------------------------------------------- 如果不是，就调用列表模块，并且将可能存在的参数都传递过去
CALL :List %1 %2
IF not "%error%"=="" GOTO :eof
REM ------------------------------------------- 判断是否返回返回值
IF NOT "%return%"=="" (
REM ------------------------------------------- 如果有，那就判断使用什么执行引擎来执行后面的任务
IF "%engine%"=="call" CALL :%return%
IF "%engine%"=="goto" GOTO %return%
REM -------------------------------------------前往结束模块
GOTO end
) else CALL :error 程序发生了错误，功能列表没有返回返回值
) else CALL :error 错误,这个工具必须要有一个参数 
IF not "%error%"=="" GOTO :eof
GOTO end
::

::
:run
REM -------------------------------------------- 查询是否存在临时性文件，如果存在就删除这个文件
IF EXIST C:\%1.tmp del /s /q /f C:\%1.tmp
REM -------------------------------------------- 把搜索得到的列表存在临时文件里
FOR /R %2\ %%v IN (*%1) DO ECHO %%v>>C:\%1.tmp
REM -------------------------------------------- 读出临时文件中的内容并删除临时文件
TYPE C:\%1.tmp&del C:\%1.tmp
GOTO :eof
::

::
:List
SET name=%1
REM --------------------------------------------- 查询参数1是不是一个"/"参数
IF "%name:~,1%"=="/" (
REM --------------------------------------------- 如果是就去功能列表查询要用什么解释器
CALL :List-gn %name:~1,1%
REM --------------------------------------------- 查询返回值是否为空，为空就返回错误和错误原因
IF "%return%"=="" set engine=call&set return=error 没有这个开关
goto :eof
)
SET name=
REM --------------------------------------------- 如果不是就作为搜索参数来处理
REM --------------------------------------------- 先检查有没有指定搜索的路径
IF NOT "%2"=="" (
REM --------------------------------------------- 如果有，就判断这个路径是否为一个有效路径，非有效路径就退出
DIR %2>nul
IF NOT "%ERRORLEVEL%"=="0" CALL :error 这不是一个有效的路径
IF not "%error%"=="" GOTO :eof
REM --------------------------------------------- 若路径有效，就设置运行此参数的引擎
SET engine=call
)
REM --------------------------------------------- 并且设置返回值
SET return=run %1 %2
GOTO :eof
::

::
:List-gn
IF "%1"=="?" set return=help&GOTO :eof
GOTO :eof
::

:error
ECHO 错误：%1
set error=true
GOTO :eof

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

:end
SET error=
SET return=
SET run=