@echo off
:main
echo ����Ҫ�Ժ��ַ�ʽ���������⣿
echo 1.����ʾһ���������
echo 2.���������ļ�(�Ҷ�)
echo q.����
set /p xx=:
cls
if "1"=="%xx%" set xx=& call :Have_Prompt
if "2"=="%xx%" set xx=& call :Open_File
if "q"=="%xx%" set xx=& exit /b 0
if "Q"=="%xx%" set xx=& exit /b 0
goto main

:::Have_Prompt:::
:Have_Prompt
echo -"��ʾ"��������,�����ڴ���
exit /b
:::Have_Prompt:::

:::Open_File:::
::���������ļ�
:Open_File
echo -"����"��������,�����ڴ���
exit /b
:::Open_File:::
