@echo off
set sun=0
set sun2=0
:main
set b=3
set a=%b%
:y
set /a a=%a%/2
set /a sun+=1
if %a%==0 (goto n) else goto y
:n
set a=%b%
:n2
set /a sun2+=1
set /a a=%a%2%
if %sun2%==%sun% goto e
:e

pause
goto :eof