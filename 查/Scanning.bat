@echo off
if "%1"=="" goto main
if "%1"=="main" echo ͼ�񻯽�����δ���ţ������ڴ������汾&goto :eof
if "%1"=="1" goto drive
if "%1"=="2" goto ScanningList
if "%1"=="3" goto Scanning
goto :eof
:main
mode con cols=80 lines=25
echo ��黷��....
call start /w "��黷��" "%0" 1
if exist "%temp%\pf.tmp" (
type "%temp%\pf.tmp">".\DriveList"
del /s /q /f "%temp%\pf.tmp">nul
)
if exist .\DriveList (
for /f %%a in (.\DriveList) do (
>>.\temp set /p=%%a;<nul
)
)
if exist .\temp for /f %%a in (.\temp) do set pf=%%a&del /s /q /f .\temp>nul
echo -------------------------------------------------------------------------------
echo 	ϵͳ:%OS%
if "%PROCESSOR_ARCHITECTURE%"=="x86" set xt=32
if "%PROCESSOR_ARCHITECTURE:~-2%"=="64" set xt=64
if "%xt%"=="" set xt=δʶ��
echo 	ϵͳλ��:%PROCESSOR_ARCHITECTURE%(%xt%)
set xt=
echo 	��ǰ�û�:%username%
echo 	������ϵķ���:%pf%
set pf=
echo 	��ǰϵͳ����:%SystemDrive%
echo 	�������ִ���ļ������ȼ�:
echo 		%PATHEXT%
echo -------------------------------------------------------------------------------
echo ���컷��....
(echo acojrnbgyk.vbs
echo autorun.inf
echo .lnk
echo Thumb.db)>>.\SList.txt
echo ��������....
call start /w "��������" "%0" 2
if exist .\ScanningList.tmp for /f "delims=" %%a in (.\ScanningList.tmp) do @set /a Quantity+=1
::call :Calculation_schedule %Quantity%
echo ����ɨ��....
if exist .\VirusList.txt del /s /q /f .\VirusList.txt>nul
call start /w "����ɨ��" "%0" 3
if exist .\ScanningList.tmp del /s /q /f .\ScanningList.tmp>nul
del /s /q /f ".\DriveList" ".\SList.txt">nul
set Quantity=
call :h
set /p=ִ�����,��%errorlevel%�������ļ�,<nul
call :h
set h=
exit /b %errorlevel%
goto :eof
::

::
:h
set h=0
if exist .\VirusList.txt for /f "delims=" %%a in (.\VirusList.txt) do @set /a h+=1
exit /b %h%
::

::
:Scanning
mode con cols=38 lines=1
SETLOCAL ENABLEDELAYEDEXPANSION
set isun=0
for /f "delims=" %%f in (.\ScanningList.tmp) do (
set /a isun+=1
title ����ɨ��^(!isun!^/!Quantity!^)
findstr /s /i /m "WScript.exe //e:VBScript" "%%f">nul
if "!errorlevel!"=="0" echo %%f>>VirusList.txt
if ".vbs"=="%%~xf" (fc ".\acojrnbgyk.yb" "%%f">nul
if "!errorlevel!"=="0" echo %%f>>VirusList.txt)
)
set isun=
set frequency=
set Quantity=
ENDLOCAL
exit
::

----------------------------��Զ���ᱻִ�еĳ����϶
----------------����ͼ�λ�ר�õİٷֱȼ��㣬δ�����������ʽ���У����ǲ����Թ��ܣ�
if "!isun!"=="!frequency!" (
set isun=0
call :title_display ����ɨ��
)


::
:ScanningList
title ��������
mode con cols=31 lines=1
set /p=���ں�Ŭ���Ĵ��������ļ���....<nul
if exist .\ScanningList.tmp del /s /q /f ".\ScanningList.tmp">nul
for /f %%a in (.\DriveList) do (
for /f %%b in (.\SList.txt) do (
call :SF %%b %%a:\>>".\ScanningList.tmp"
))
exit
::

:drive
title ��黷��
set errorlevel=
mode con cols=30 lines=1
if exist "%temp%\pf.tmp" del /s /q /f "%temp%\pf.tmp">nul
SETLOCAL ENABLEDELAYEDEXPANSION
for %%p in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
dir %%p:\>nul
if !errorlevel!==0 echo %%p>>"%temp%\pf.tmp"
)
ENDLOCAL
cls
exit

:SF
IF EXIST "%temp%\SF.tmp" del /s /q /f "%temp%\SF.tmp"
::--------------------------------------------------------------����������(������������ʽ����ʱ��������)
::FOR /R %2\ %%a IN (*%1) DO @ECHO "%%a">>"%temp%\SF.tmp"
::--------------------------------------------------------------�����Ͳ�λ����������(���ڼ������ͨ�����������)
dir "%2*%1" /a rhasil /s /b|find "%1">>"%temp%\SF.tmp"
if exist "%temp%\SF.tmp" (
TYPE "%temp%\SF.tmp"
del /s /q /f "%temp%\SF.tmp">nul
)
goto :eof

:::title_condition:::
::
:Calculation_schedule
:title_condition
set Quantity=%1
if /i %Quantity% GEQ 100 (call :title_percent %Quantity%) else call :title_frequency
exit /b %frequency%
goto :eof
::

::title_condition::
:title_percent
set title_method=percent
set Quantity=%1
set /a frequency=%Quantity%/100
set /a residue=%Quantity%%%100
::--------------------------------------------------------------------------- �����б���������Ȳ���99%��ס��,������㵽100%��ʱ���Ѿ�û������,������������ھ�������
::----------------------------------------------------------------------------set /a residue*=50
::----------------------------------------------------------------------------if /i %frequency% lss %residue% set /a frequency+=1
set Quantity=
set residue=
goto :eof
::::

::title_condition::
:title_frequency
set title_method=frequency
set frequency=1
goto :eof
::::
:::title_condition:::

:::title_display:::
::
:Calculation_schedule
:title_display

if exist ".\ScanningList.tmp" for /f "delims=" %%a in (.\ScanningList.tmp) do @set /a Quantity+=1
call :Calculation_schedule %Quantity%

if "%title_perent_sun%"=="" set title_perent_sun=0
if "%title_perent_sun%"=="100"goto :eof
if not "%title_method%"=="" (
if "%title_method%"=="frequency" call :percent_frequency_mode %1 %title_perent_sun%
if "%title_method%"=="percent" call :percent_percent_mode %1 %title_perent_sun%
) else echo ����û�ж������title_method&exit /b
title %title%
exit /b
::

::title_display::
:percent_frequency_mode
set title=%1^(%2/%Quantity%^)
set /a title_perent_sun+=1
exit /b
::::

::title_display::
:percent_percent_mode
set title=%1^(%2%%^)
set /a title_perent_sun+=1
exit /b
::::
:::title_display:::