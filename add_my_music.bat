@echo off
echo This command will completely overwrite the Songs_Gameplay.xml file of this modification. If you agree, press Enter, and if not, close this window.
pause

setlocal enabledelayedexpansion
set "Songs_Gameplay_XML_path=Defs\SongDefs"

set "music_path=Sounds\Gameplay"


chcp 65001
echo ^<?xml version="1.0" encoding="utf-8" ?^> > "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
echo ^<Defs^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"

for %%f in ("%music_path%\*") do (
	set sound_name=%%~nf

	echo ^<SongDef^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<defName^>!sound_name!^</defName^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<clipPath^>Gameplay/!sound_name!^</clipPath^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo. >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<^^!--The probability of music appearing in the game--^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<commonality^>1.0^</commonality^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo. >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<^^!--Music volume--^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<volume^>1.0^</volume^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo. >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<^^!--If true, it only plays in a combat situation--^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<tense^>false^</tense^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo. >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<^^!--If you want to limit the time of day, delete '^<^^!- -' and '- -^>' of the desired option--^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<^^!--^<allowedTimeOfDay^>Day^</allowedTimeOfDay^>--^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<^^!--^<allowedTimeOfDay^>Night^</allowedTimeOfDay^>--^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo. >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<^^!--Listing the seasons in which this song is played--^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo 	^<allowedSeasons^> ^<li^>Winter^</li^>^<li^>Spring^</li^>^<li^>Summer^</li^>^<li^>Fall^</li^> ^</allowedSeasons^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"

	echo ^</SongDef^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo. >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"
	echo Added !sound_name!
)

echo ^</Defs^> >> "%Songs_Gameplay_XML_path%\Songs_Gameplay.xml"

echo Songs_Gameplay.xml overwritten. After restarting the game, music will be added.
pause