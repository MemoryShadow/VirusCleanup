@echo off
mode con cols=80 lines=25
title Virus killing Bata
cd /d %cd%
:main
if exist UI_mode.* (call UI_mode) else echo û���ҵ����棬����������˳�����&pause&exit
if "%errorlevel%"=="0" exit /b
if "%errorlevel%"=="1" call :search
if "%errorlevel%"=="2" call :Data_REC
if "%errorlevel%"=="3" call :Updata
if "%errorlevel%"=="4" call :Feature_Library
if "%errorlevel%"=="5" call :about_us
if not "%errorlevel%"=="0" pause
set errorlevel=
goto main
:::search:::
:search
title ��ɱ
call :UP_main ��ɱ
set errorlevel=
if exist .\Scanning.* (call Scanning) else call :UP_main û���ҵ�ɨ��ģ�飬��������Ҫ���°�װ&exit /b 1
cls
if exist .\killing.* (
if not "%errorlevel%"=="0" (
echo ���ֿ����ļ�%errorlevel%����ɾ��?[y,n]
set errorlevel=
call :killing
cls
call :UP_main �������
) else call :UP_main û���ҵ�����Ⱦ�ļ�) else call :UP_main ���ֿ����ļ�%errorlevel%������������û��������豸���ҵ��������棬�����°�װ
set errorlevel=
exit /b 0
:::search:::

:::killing:::
:killing
title �����
set errorlevel=
set /p xx=:
if "y"=="%xx%" set xx=&call killing&exit /b 0
if "Y"=="%xx%" set xx=&call killing&exit /b 0
set xx=
:::killing:::

:::Data_REC:::
:Data_REC
title ���ݻָ�
set errorlevel=
if exist .\Data_REC.* (
call Data_REC
cls
) else call :UP_main "���ݻָ�"�������ߣ������ڴ���&exit /b 1
exit /b 0
:::Data_REC:::

:::Updata:::
:Updata
title ������
set errorlevel=
if exist .\Updata.* (
call Updata
cls
) else call :UP_main "������"�������ߣ������ڴ���&exit /b 1
exit /b 0
:::Updata:::

:::Feature_Library:::
:Feature_Library
title ����������
set errorlevel=
if exist .\Feature_Library.* (
call Feature_Library
cls
) else call :UP_main "����������"�������ߣ������ڴ���&exit /b 1
exit /b 0
:::Feature_Library:::

:::about_us:::
:about_us
title ��������
set errorlevel=
if exist .\about_us.* (
call about_us
cls
) else call :UP_main "����"�������ߣ������ڴ���&exit /b 1
exit /b 0
:::about_us:::

:::UP_main:::
:UP_main
::�ڶ�����ʾһ����Ϣ��û�з���ֵ(��ˢ����Ļ)
:: call :UP_main [Ҫ��ʾ����Ϣ]
cls
echo %1
echo -------------------------------------------------------------------------------
exit /b
:::UP_main:::