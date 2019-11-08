@ECHO OFF

REM create folder c:\java and copy your jdk there

SETX /M JAVA_HOME "C:\java\jdk"
SETX /M PATH "%PATH%;%JAVA_HOME%\bin"

echo %PATH%
