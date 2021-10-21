@echo off
:Calculation_schedule
:title_display
if "%title_perent_sun%"=="" set title_perent_sun=0
if "%title_perent_sun%"=="100" set title_perent_sun=
if not "%title_method%"=="" (
if "%title_method%"=="frequency" call :percent_frequency_mode %1 %title_perent_sun%
if "%title_method%"=="percent" call :percent_percent_mode %1 %title_perent_sun%
) else echo 错误，没有定义变量title_method&exit /b
set title
title %title%
exit /b

::
:percent_frequency_mode
set title=%1^(%2/%Quantity%^)
set /a title_perent_sun+=1
exit /b
::

::
:percent_percent_mode
set title=%1^(%2%%^)
set /a title_perent_sun+=1
exit /b
::