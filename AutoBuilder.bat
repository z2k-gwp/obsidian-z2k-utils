@echo off
cls
echo AutoBuilder is a simple Windows batch for launching a build watch for 
echo one of your plugins. It will also prelaunch obsidian to your Dev Vault.
echo -----------------------------------------------------------------------
echo:

rem -----------------------------------------------------------------------
rem To use, specify the configuration variables below and let her rip!
rem -----------------------------------------------------------------------

rem Configuration:
rem -----------------------------------------------------------------------
rem Note: if you have spaces in your dev vault name, replace them with %%20
rem   (and yes, two percentages)
rem
set prefix=obsidian-
set pluginDir=C:\Users\YourUserName\Obsidian\My Vault\.obsidian\plugins
set devVault=Dev%%20Vault

rem Initialization:
rem -----------------------------------------------------------------------
set obsidianCommand=obsidian://open?vault=
setlocal enabledelayedexpansion
set count=0

rem Go to the plugin directory
rem -----------------------------------------------------------------------
cd %pluginDir%

rem Launch Obsidian
rem -----------------------------------------------------------------------
start %obsidianCommand%%devVault%

rem Read the available plugins
rem -----------------------------------------------------------------------
echo The following plugins are ready for building:
echo:
for /d %%x in (%prefix%*) do (
  set /a count=count+1
  set choice[!count!]=%%x
)

rem Prompt for which one to use
rem -----------------------------------------------------------------------
echo:
echo Please select the plugin you wish to launch a build-watch for:
echo:

rem Print list of files
rem -----------------------------------------------------------------------
for /l %%x in (1,1,!count!) do (
   echo %%x] !choice[%%x]!
)
echo:

rem Print list of files
rem -----------------------------------------------------------------------
set /p select=? 
echo:

rem Now build watch!
rem -----------------------------------------------------------------------
echo Now auto building !choice[%select%]!
echo:
cd !choice[%select%]!
npm run dev
