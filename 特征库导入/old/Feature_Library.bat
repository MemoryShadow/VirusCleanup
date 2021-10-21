@echo off
:main
echo 您想要以何种方式导入特征库？
echo 1.和提示一起完成配置
echo 2.导入配置文件(灰度)
echo q.返回
set /p xx=:
cls
if "1"=="%xx%" set xx=& call :Have_Prompt
if "2"=="%xx%" set xx=& call :Open_File
if "q"=="%xx%" set xx=& exit /b 0
if "Q"=="%xx%" set xx=& exit /b 0
goto main

:::Have_Prompt:::
:Have_Prompt
echo -"提示"即将上线,敬请期待。
exit /b
:::Have_Prompt:::

:::Open_File:::
::导入配置文件
:Open_File
echo -"导入"即将上线,敬请期待。
exit /b
:::Open_File:::
