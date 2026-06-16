:: Notepad, by Kine59
:: 06/10/2026 (June 10, 2026)

@echo off
color F0

goto :menu

:menu
    echo +-- Notepad by Kine59
    echo ^> 1. New
    echo ^> 2. Open
    echo ^> 3. Exit
    echo: 
    echo +-- What is your choice?
    choice /c 123

    if errorlevel 3 goto :exit
    if errorlevel 2 goto :open
    if errorlevel 1 goto :writing

:writing
    cls
    echo New blank textfile made!
    timeout /t 1
    cls
    echo Text:
    set /p text=
    cls
    echo File Name (please include the file type at the end):
    set /p filename=
    echo %text% > %USERPROFILE%\Desktop\%filename%
    cls
    goto :menu
:open
    cls
    echo Please choose your file (from the Desktop folder):
    set /p filename=
    type %USERPROFILE%\Desktop\%filename% &:: suggested by u/Shadow_Thief
    pause
    cls
    goto :menu
:exit
    cls
    echo Quitting
    timeout /t 2
    exit
