:: Notepad, by Kine59
:: 06/10/2026 (June 10, 2026)

@echo off
cls
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\kine59_notepad" /v "Developer" 

if %errorlevel% equ 0 (
    cls
    goto :devmenu
) else (
    cls
    goto :menu
)

:devmenu
    color 02
    echo +-- Developer Menu
    echo ^> 1. Start notepad.bat
    echo ^> 2. Refresh
    echo ^> 3. Quit
    echo: 
    choice /c 123

    if errorlevel 3 goto :exit
    if errorlevel 2 (
        start notepad.bat
        exit
    )
    if errorlevel 1 (
        cls
        goto :menu
    )

:menu
    color F0
    echo +-- Notepad by Kine59
    echo ^> 1. New &:: the caret escapes the syntax
    echo ^> 2. Open
    echo ^> 3. About
    echo ^> 4. Exit
    echo: 
    echo +-- What is your choice?
    choice /c 1234

    if errorlevel 4 goto :exit
    if errorlevel 3 goto :about
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
    echo ^> 2. Append
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

:about &:: About section for Notepad
    cls
    echo +-- About
    echo This is a simple notepad app made in the batch programming language. 
    echo It is quite limited though as it only saves (overwriting and appending) and opens files from the desktop.
    echo:
    echo +-- License
    echo This script uses the unlicense license. TLDR: Do whatever you want with it.
    echo: 
    echo This is free and unencumbered software released into the public domain.
    echo:
    echo Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.
    echo: 
    echo In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. 
    echo We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. 
    echo We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.
    echo:
    echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
    echo EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
    echo IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
    echo TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
    echo:
    echo For more information, please refer to https://unlicense.org
    echo:
    echo +-- Repository
    echo https://github.com/kine59/notepad.bat
    echo:
    echo +-- Press any key to go back to the menu
    pause
    cls
    goto :menu
:exit
    cls
    echo Quitting
    timeout /t 2 /nobreak
    exit
