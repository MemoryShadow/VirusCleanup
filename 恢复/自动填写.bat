@echo off
set /p a=:
set /p b=:
if %b%==0 goto :eof
(echo if %%1==%a% set pf=%b%)>>list.txt
:y
set /p b=:
if %b%==0 goto :eof
(echo if %%1==%a% set pf=%b%)>>list.txt
set a=%b%
goto y
goto :eof
:f
