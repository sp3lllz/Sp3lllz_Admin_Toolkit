:: Dead Folder Finder
:: v1.0
:: Written By Sp3lllz
:: https://github.com/sp3lllz/Sp3lllz_Toolkit
:: Use Permitted under MIT licence

@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    
ECHO Updating Certificates.. please wait..
"c:\Program Files\Lightspeed Systems\Smart Agent\makeca.exe" -dir %temp%\ >NUL
move /y %temp%\*.pem "c:\Program Files\Lightspeed Systems\Smart Agent" >NUL
certutil.exe -addstore root "c:\Program Files\Lightspeed Systems\Smart Agent\ca.pem" >NUL
net stop lssasvc >NUL
net start lssasvc >NUL
