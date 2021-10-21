@echo off
echo 注意：此操作会重置您u盘中的自动运行脚本【Autorun.inf】和【Autorun.ini】
echo --------------------------------------------------------------------------------
set /p uu=请输入被感染的u盘盘符:
:csup
cls
title 正在查杀若在此处卡死说明病毒已变种请迅速联系我QQ：2320667376
attrib -r +a -h -s /s /d /l %uu%:\Autorun.inf
attrib -r +a -h -s /s /d /l %uu%:\Autorun.ini
attrib -r +a -h -s /s /d /l %uu%:\acojrnbgyk.vbs
del %uu%:\acojrnbgyk.vbs
(echo [autorun]
echo icon=New.ico)>%uu%:\Autorun.inf
(echo [autorun]
echo icon=New.ico)>%uu%:\Autorun.ini
echo y|call taskkill /f /im wscript.exe /t
if exist %tamp%\acojrnbgyk.vbs %0
if exist %uu%:\acojrnbgyk.vbs goto csup
cls
echo 查杀完毕
title 数据还原
echo 全盘数据恢复ing......
attrib -r +a -h -s /s /d /l %uu%:\*
attrib +r -a +h +s /s /d /l %uu%:\Autorun.*
attrib +r -a +h +s /s /d /l %uu%:\New.*
exit /b 0