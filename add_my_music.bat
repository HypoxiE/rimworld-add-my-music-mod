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
	echo 	^<clipPath^>Gameplay/!sound_name!^</clipPath^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<volume^>1^</volume^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo 	^<tense^>false^</tense^> >> Defs\SongDefs\Songs_Gameplay.xml
	echo ^</SongDef^> >> Defs\SongDefs\Songs_Gameplay.xml
)

echo ^</Defs^> >> Defs\SongDefs\Songs_Gameplay.xml

echo Songs_Gameplay.xml overwritten. After restarting the game, music will be added.
pause