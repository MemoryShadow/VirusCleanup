@echo off
echo ע�⣺�˲�����������u���е��Զ����нű���Autorun.inf���͡�Autorun.ini��
echo --------------------------------------------------------------------------------
set /p uu=�����뱻��Ⱦ��u���̷�:
:csup
cls
title ���ڲ�ɱ���ڴ˴�����˵�������ѱ�����Ѹ����ϵ��QQ��2320667376
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
echo ��ɱ���
title ���ݻ�ԭ
echo ȫ�����ݻָ�ing......
attrib -r +a -h -s /s /d /l %uu%:\*
attrib +r -a +h +s /s /d /l %uu%:\Autorun.*
attrib +r -a +h +s /s /d /l %uu%:\New.*
exit /b 0