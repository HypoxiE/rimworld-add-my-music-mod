@echo off
echo This command will completely overwrite the Songs_Gameplay.xml file of this modification. If you agree, press Enter, and if not, close this window.
pause

setlocal enabledelayedexpansion

set "localappdata=%USERPROFILE%\AppData\LocalLow"
set "mod_user_dir=%localappdata%\Ludeon Studios\RimWorld by Ludeon Studios\AddMyMusic_data"
if not exist "%mod_user_dir%" mkdir "%mod_user_dir%"

set "music_database=%mod_user_dir%\music_is_here"
if not exist "%music_database%" mkdir "%music_database%"


chcp 65001
echo ^<?xml version="1.0" encoding="utf-8" ?^> > "%mod_user_dir%\Songs_Gameplay.xml"
echo ^<Defs^> >> "%mod_user_dir%\Songs_Gameplay.xml"

for %%f in ("%music_database%\*") do (
	set sound_name=%%~nf

	echo ^<SongDef^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<defName^>!sound_name!^</defName^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<clipPath^>Gameplay/!sound_name!^</clipPath^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo. >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<^^!--The probability of music appearing in the game--^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<commonality^>1.0^</commonality^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo. >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<^^!--Music volume--^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<volume^>1.0^</volume^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo. >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<^^!--If true, it only plays in a combat situation--^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<tense^>false^</tense^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo. >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<^^!--If you want to limit the time of day, delete '^<^^!- -' and '- -^>' of the desired option--^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<^^!--^<allowedTimeOfDay^>Day^</allowedTimeOfDay^>--^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<^^!--^<allowedTimeOfDay^>Night^</allowedTimeOfDay^>--^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo. >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<^^!--Listing the seasons in which this song is played--^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo 	^<allowedSeasons^> ^<li^>Winter^</li^>^<li^>Spring^</li^>^<li^>Summer^</li^>^<li^>Fall^</li^> ^</allowedSeasons^> >> "%mod_user_dir%\Songs_Gameplay.xml"

	echo ^</SongDef^> >> "%mod_user_dir%\Songs_Gameplay.xml"
	echo. >> "%mod_user_dir%\Songs_Gameplay.xml"
)

echo ^</Defs^> >> "%mod_user_dir%\Songs_Gameplay.xml"

echo Songs_Gameplay.xml overwritten. After restarting the game, music will be added.
pause