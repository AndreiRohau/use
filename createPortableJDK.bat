@ECHO OFF

SETLOCAL ENABLEDELAYEDEXPANSION

SET ROOT=%cd%

REM Add path to 7z.exe - find and install at https://www.7-zip.org/
SET PATH=%PATH%;C:\Program Files\7-Zip\

REM Get the tools.zip from the innards of the installer
7z e *.exe .rsrc/1033/JAVA_CAB10/111
7z e 111 7z x tools.zip

7z e *.exe .rsrc/1033/JAVA_CAB9/110
7z e 110 7z x src.zip

REM Extract all
7z x -aoa tools.zip -ojdk

REM Searching directory structure from root for subfolders and zipfiles.
FOR /F "delims==" %%d IN ('dir /ogne /ad /b /s "%ROOT%"') DO (
    echo Descending into %%d
    FOR /F "delims==" %%f IN ('dir /b "%%d\*.pack"') DO (
        echo Extracting "%%d\%%f"
        REM Extract all packs into jars.
        jdk\bin\unpack200 -r  "%%d\%%f" "%%d\%%~nf.jar"
    )
)

REM Copy source files
copy src.zip jdk

REM delete tmp extracted files
del tools.zip
del 111
del 110
del src.zip

ENDLOCAL
pause;
