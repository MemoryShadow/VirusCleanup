@echo off
if exist %SystemDrive%\pf.tmp del /s /q /f %SystemDrive%\pf.tmp>nul
set pf=a
:y
dir %pf%:\>nul
if %errorlevel%==0 echo %pf%>>%SystemDrive%\pf.tmp
cls
call :list %pf%
if not %pf%==0 goto y
set pf=
exit /b 0
:list
if "%1"=="" set pf=a
if %1==a set pf=b
if %1==b set pf=c
if %1==c set pf=d
if %1==d set pf=e
if %1==e set pf=f
if %1==f set pf=g
if %1==g set pf=h
if %1==h set pf=i
if %1==i set pf=j
if %1==j set pf=k
if %1==k set pf=l
if %1==l set pf=m
if %1==m set pf=n
if %1==n set pf=o
if %1==o set pf=p
if %1==p set pf=q
if %1==q set pf=r
if %1==r set pf=s
if %1==s set pf=t
if %1==t set pf=u
if %1==u set pf=v
if %1==v set pf=w
if %1==w set pf=x
if %1==x set pf=y
if %1==y set pf=z
if %1==z set pf=0
goto :eof