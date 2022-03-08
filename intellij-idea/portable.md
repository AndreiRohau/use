Create portable version of Oracle JDK
From https://techtavern.wordpress.com/2014/03/25/portable-java-8-sdk-on-windows/

Download the Java 8 SDK for Windows from Oracle. You will get a file named like java-8-windows-x64.exe. (http://www.oracle.com/technetwork/java/javase/downloads)

Open the downloaded file with 7-Zip, which will show a single archived file named tools.zip.

Open the tools.zip from within 7-Zip.

Extract its contents to a directory where own write permissions, for example: C:\Users\Daniel\Documents\java-8-sdk

From within this directory, search for all .pack files and extract them into .jar files, using unpack2000.exe command line tool found in the bin subdirectory. Following windows prompt command does the trick when executed from within the extracted directory:

for /r %i in (*.pack) do .\bin\unpack200.exe "%i" "%~pi%~ni.jar"
Delete *.pack files.
