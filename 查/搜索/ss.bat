@echo off
if not "%1"=="" (
if "%1"=="/?" goto help
) else %0 .tmp C:\

::
:run
IF NOT "%2"=="" (
DIR %2>nul
IF NOT "%ERRORLEVEL%"=="0" CALL :error �ⲻ��һ����Ч��·��
IF not "%error%"=="" set error=&GOTO :eof
) else CALL :run %1 C:\&goto :eof
IF EXIST C:\%1.tmp del /s /q /f C:\%1.tmp
FOR /R %2 %%a IN (*%1) DO ECHO %%a>>C:\%1.tmp
if exist C:\%1.tmp (TYPE C:\%1.tmp&del C:\%1.tmp) else echo ��%2��û���ҵ������а���%1���ļ�
set ERRORLEVEL=0
GOTO :eof
::

::
:error
ECHO ����%1
set error=true
GOTO :eof
::

:help
ECHO �����ļ���
ECHO.
ECHO SF [^/?] [filename] [drive:][path]
ECHO 	[/?]	��ð�������
ECHO 	[filename]
ECHO 		Ҫ�������ļ�����
ECHO 	[drive:][path]
ECHO 		ָ������·�������ȱʡ����Ե�ǰĿ¼��������
ECHO 	ע��:�����ߵ�����˳�򣬿��ܻ���д��������
GOTO :eof
