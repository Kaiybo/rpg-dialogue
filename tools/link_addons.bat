@echo off
rem Links every addon folder in this repo into your WoW AddOns folder (Windows, no admin needed).
rem Usage: tools\link_addons.bat "C:\Program Files (x86)\World of Warcraft\_forever_\Interface\AddOns"
rem (Check the folder name for Forever on your machine; the beta used _classic_beta_.)
setlocal
set "ADDONS=%~1"
if "%ADDONS%"=="" (
  echo Give the path to your Interface\AddOns folder.
  exit /b 1
)
if not exist "%ADDONS%" (
  echo That folder doesn't exist: %ADDONS%
  exit /b 1
)
set "REPO=%~dp0.."
for /d %%D in ("%REPO%\RPGDialogue" "%REPO%\RPGDialogue_*") do (
  if exist "%ADDONS%\%%~nxD" (
    echo Skipping %%~nxD: something with that name is already in AddOns. Remove it first to link.
  ) else (
    mklink /J "%ADDONS%\%%~nxD" "%%~fD" >nul && echo linked %%~nxD
  )
)
endlocal
