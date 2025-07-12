@echo off
echo This command will completely overwrite the Songs_Gameplay.xml file of this modification. If you agree, press Enter, and if not, close this window.
pause

setlocal enabledelayedexpansion
chcp 65001
echo ^<?xml version="1.0" encoding="utf-8" ?^> > Defs\SongDefs\Songs_Gameplay.xml
echo ^<Defs^> >> Defs\SongDefs\Songs_Gameplay.xml

for %%f in (Sounds\Gameplay\*) do (
	set sound_name=%%~nf

	echo ^<SongDef^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<defName^>!sound_name!^</defName^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<clipPath^>Gameplay/!sound_name!^</clipPath^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo. >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<^^!--The probability of music appearing in the game--^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<commonality^>1.0^</commonality^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo. >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<^^!--Music volume--^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<volume^>1.0^</volume^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo. >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<^^!--If true, it only plays in a combat situation--^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<tense^>false^</tense^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo. >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<^^!--If true, it only plays in a combat situation--^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<tense^>false^</tense^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo. >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<^^!--If you want to limit the time of day, delete '^<^^!- -' and '- -^>' of the desired option--^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<^^!--^<allowedTimeOfDay^>Day^</allowedTimeOfDay^>--^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<^^!--^<allowedTimeOfDay^>Night^</allowedTimeOfDay^>--^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo. >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<^^!--Listing the seasons in which this song is played--^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<allowedSeasons^> ^<li^>Winter^</li^>^<li^>Spring^</li^>^<li^>Summer^</li^>^<li^>Fall^</li^> ^</allowedSeasons^> >> Defs\SongDefs\Songs_Gameplay.xml

	echo ^</SongDef^> >> Defs\SongDefs\Songs_Gameplay.xml
)

echo ^</Defs^> >> Defs\SongDefs\Songs_Gameplay.xml

echo Songs_Gameplay.xml overwritten. After restarting the game, music will be added.
pause