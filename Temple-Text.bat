@echo off
::version 2.0
title Temple Text
:folder
DIR C:\Users\Home\Desktop\TempleText >nul
cls
if %errorlevel%==1 goto mkfldr
goto start
:mkfldr
mkdir C:\Users\Home\Desktop\TempleText
attrib +h C:\Users\Home\Desktop\TempleText /s /d
@echo Entries- >> C:\Users\Home\Desktop\TempleText\entries.txt
@echo. >> C:\Users\Home\Desktop\TempleText\entries.txt
:start
cls
color 79
:: bad color 7C
echo Do you want to look for a file, delete a file, create a new file, add onto or read an existing file?
echo.
set/p choice="FIND - DELETE - NEW - ADD - READ: "
if %choice%==DELETE goto delete
if %choice%==NEW goto new
if %choice%==ADD goto add
if %choice%==READ goto read
if %choice%==FIND goto find
if %choice%==REBOOTSYST del C:\Users\Home\Desktop\TempleText
cls
color 7C
echo Sorry your answer was unclear
pause >nul
goto start
:new
cls
echo What will you name this new file?
set /p fn=">>"
@echo %fn% -- %date% >> C:\Users\Home\Desktop\TempleText\entries.txt
cls
find "%fn%" "C:\Users\Home\Desktop\TempleText\%fn%".txt >nul
if %errorlevel%==1 goto conti
goto artyp
:conti
cls
@echo %fn%- >> C:\Users\Home\Desktop\TempleText\"%fn%".txt
cls
echo What would you like your end word to be?
echo You will type this word ONLY when you want to cease writing.
set /p ew=">>"
goto res
:artyp
color 7C
cls
echo Sorry that file has already been created.
pause >nul
goto start
:res
cls
echo Your end word is %ew%:
echo Type your document-
set /p ctnt=">>"
if "%ctnt%" == "%ew%" goto enew
@echo. >> C:\Users\Home\Desktop\TempleText\"%fn%".txt
@echo %ctnt% >> C:\Users\Home\Desktop\TempleText\"%fn%".txt
goto res
:enew
cls
echo Document Complete!
pause >nul
goto start
:read
cls
echo What file would you like to open?
set /p fo="type file name without extension: "
cls
echo.
type C:\Users\Home\Desktop\TempleText\"%fo%".txt
if %errorlevel% == 1 goto retry
pause >nul
goto start
:retry
cls
color 7C
echo Sorry file not found.
pause >nul
goto start
:add
cls
echo What is the name of the file you are trying to add onto?
set /p fna="type file name without extention: "
find "%fna%" "C:\Users\Home\Desktop\TempleText\%fna%".txt >nul
if %errorlevel%==1 goto fail
cls
echo File found!
pause >nul
cls
echo What would you like your end word to be?
echo You will type this word ONLY when you want to cease writing.
set /p ewe=">>"
cls
goto ewe
:ewe
cls
echo Your end word is %ewe%:
echo Type your document-
set /p ncnt=">>"
if "%ncnt%" == "%ewe%" goto enew
@echo. >> C:\Users\Home\Desktop\TempleText\"%fna%".txt
@echo %ncnt% >> C:\Users\Home\Desktop\TempleText\"%fna%".txt
goto ewe
:fail
cls
color 7C
echo Sorry that file does not exist.
pause >nul
goto start
:find
cls
type C:\Users\Home\Desktop\TempleText\entries.txt
pause >nul
goto start
:delete
cls
echo What is the name of the file you want to delete?
set /p deloye=">>"
del C:\Users\Home\Desktop\TempleText\%deloye%.txt
::findstr /I /B /V %deloye% C:\Users\Home\Desktop\TempleText\entries.txt
findstr /v /i /c:"%deloye%" C:\Users\Home\Desktop\TempleText\entries.txt > C:\Users\Home\Desktop\TempleText\results.txt
del C:\Users\Home\Desktop\TempleText\entries.txt
ren C:\Users\Home\Desktop\TempleText\results.txt entries.txt
cls
echo File deleted!
pause >nul
goto start