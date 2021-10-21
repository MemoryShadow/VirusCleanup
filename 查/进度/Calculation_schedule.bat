@echo off
set Quantity=

:Calculation_schedule
:title_condition
if /i %Quantity% GEQ 100 (call :title_percent %Quantity%) else call :title_frequency
exit /b %frequency%
goto :eof

:title_percent
set title_method=percent
set Quantity=%1
set /a frequency=%Quantity%/100
set /a residue=%Quantity%%%100
if /i %frequency% lss %residue% set /a frequency+=1
echo %frequency%´ÎÎª1%%
set Quantity=
set residue=
goto :eof

:title_frequency
set title_method=frequency
set frequency=1
goto :eof

