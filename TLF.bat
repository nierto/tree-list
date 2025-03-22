@echo off
setlocal enabledelayedexpansion

rem --------------------------------------------------
rem If a folder is passed in as first argument, use it;
rem otherwise set ROOT_DIR to some default path.
rem --------------------------------------------------
if "%~1"=="" (
    SET "ROOT_DIR=\\wsl$\Ubuntu\home\ebisu\nCore"
) else (
    SET "ROOT_DIR=%~1"
)

echo Listing directories and files under: "%ROOT_DIR%" (excluding .gitignore, .dist, .git)
echo(
call :PrintTree "%ROOT_DIR%" 0
goto :EOF

rem --------------------------------------------------
rem :PrintTree <current_folder> <indent_level>
rem --------------------------------------------------
:PrintTree
    set "currentDir=%~1"
    set /a "indentLevel=%~2"
    
    rem Build indentation string
    set "indentString="
    for /l %%i in (1,1,%indentLevel%) do (
        rem Here you can choose tabs or spaces. Below uses 4 spaces:
        set "indentString=!indentString!    "
    )

    rem Show current directory name (without full path)
    if %indentLevel%==0 (
        echo %indentString%+ %currentDir%
    ) else (
        echo %indentString%+ %~n1
    )

    rem --------------------------------------------------
    rem   List files in this directory ("/a-d" => no directories)
    rem   Exclude .gitignore
    rem --------------------------------------------------
    for /f "delims=" %%f in ('dir /b /a-d "%currentDir%" 2^>nul') do (
        if /I not "%%f"==".gitignore" (
            echo %indentString%    - %%f
        )
    )

    rem --------------------------------------------------
    rem   Recursively process subdirectories ("/ad" => only directories)
    rem   Exclude .dist and .git
    rem --------------------------------------------------
    for /f "delims=" %%d in ('dir /b /ad "%currentDir%" 2^>nul') do (
        if /I not "%%d"==".dist" if /I not "%%d"==".git" (
            set /a "nextIndentLevel=%indentLevel%+1"
            call :PrintTree "%currentDir%\%%d" !nextIndentLevel!
        )
    )
    exit /b
