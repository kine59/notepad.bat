:: Notepad, by Kine59
:: 06/10/2026 (June 10, 2026)

@echo off
cls
color F0

goto :menu

:menu
    echo +-- Notepad by Kine59
    echo ^> 1. New &:: the caret escapes the syntax
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

    :: Overwrite and Append
    echo +-- How would you like your file saved?
    echo ^> 1. Overwrite
    echo ^> 2. ^Append
    echo:
    echo +-- What is your choice?
    choice /c 12
    
    if errorlevel 2 goto :sappend
    if errorlevel 1 goto :soverwrite

:soverwrite &:: Save overwrite
    cls
    echo File Name (please include the file type at the end):
    set /p filename=
    echo %text% > %USERPROFILE%\Desktop\%filename%
    cls
    goto :menu

:sappend &:: Save append
    cls
    echo File Name (please include the file type at the end):
    set /p filename=
    echo %text% >> %USERPROFILE%\Desktop\%filename% &:: >> appends text
    cls
    goto :menu

:open
    cls
    echo Please choose your file (from the Desktop folder):
    set /p filename=
    cls
    type %USERPROFILE%\Desktop\%filename% &:: suggested by u/Shadow_Thief
    echo:
    echo:
    echo Do you want to ^edit this file?
    choice /c yn 
    if errorlevel 2 (
        cls 
        goto :menu
    )
    if errorlevel 1 (
        cls 
        goto :writing
    )
    
:exit
    cls
    echo Quitting
    timeout /t 2 /nobreak
    exit
