@echo off
rem AutoBuilder is a simple Windows batch for launching a build watch for 
rem one of your plugins. To use, specify the prefix and the pluginDir variables
rem below and then let her rip!

rem Configuration:
set prefix=obsidian-z2k
set pluginDir=C:\Users\YourUserName\Obsidian\My Vault\.obsidian\plugins

echo Z2K Autobuilder launch script
echo:
setlocal enabledelayedexpansion
set count=0

cd %pluginDir%

echo The following plugins are ready for building:
echo:

:
:: Read in files
for /d %%x in (%prefix%*) do (
  set /a count=count+1
  set choice[!count!]=%%x
)

:
echo.
echo Please select the plugin you wish to launch a build-watch for:
echo.

:
:: Print list of files
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
echo.

:
:: Retrieve User input
set /p select=? 
echo.

:
:: Proceed 
echo Now auto building !choice[%select%]!
echo:
cd !choice[%select%]!
npm run dev
