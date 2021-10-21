@echo off
mode con cols=80 lines=25
title Virus killing Bata
cd /d %cd%
:main
if exist UI_mode.* (call UI_mode) else echo 没有找到界面，按下任意键退出程序&pause&exit
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
title 查杀
call :UP_main 查杀
set errorlevel=
if exist .\Scanning.* (call Scanning) else call :UP_main 没有找到扫描模块，您可能需要重新安装&exit /b 1
cls
if exist .\killing.* (
if not "%errorlevel%"=="0" (
echo 发现可疑文件%errorlevel%个，删除?[y,n]
set errorlevel=
call :killing
cls
call :UP_main 清理完毕
) else call :UP_main 没有找到被感染文件) else call :UP_main 发现可疑文件%errorlevel%个，可是我们没有在你的设备上找到解析引擎，请重新安装
set errorlevel=
exit /b 0
:::search:::

:::killing:::
:killing
title 清道夫
set errorlevel=
set /p xx=:
if "y"=="%xx%" set xx=&call killing&exit /b 0
if "Y"=="%xx%" set xx=&call killing&exit /b 0
set xx=
:::killing:::

:::Data_REC:::
:Data_REC
title 数据恢复
set errorlevel=
if exist .\Data_REC.* (
call Data_REC
cls
) else call :UP_main "数据恢复"即将上线，尽请期待。&exit /b 1
exit /b 0
:::Data_REC:::

:::Updata:::
:Updata
title 检查更新
set errorlevel=
if exist .\Updata.* (
call Updata
cls
) else call :UP_main "检查更新"即将上线，敬请期待。&exit /b 1
exit /b 0
:::Updata:::

:::Feature_Library:::
:Feature_Library
title 导入特征库
set errorlevel=
if exist .\Feature_Library.* (
call Feature_Library
cls
) else call :UP_main "导入特征库"即将上线，敬请期待。&exit /b 1
exit /b 0
:::Feature_Library:::

:::about_us:::
:about_us
title 关于我们
set errorlevel=
if exist .\about_us.* (
call about_us
cls
) else call :UP_main "关于"即将上线，敬请期待。&exit /b 1
exit /b 0
:::about_us:::

:::UP_main:::
:UP_main
::在顶栏显示一条消息，没有返回值(会刷新屏幕)
:: call :UP_main [要显示的信息]
cls
echo %1
echo -------------------------------------------------------------------------------
exit /b
:::UP_main:::