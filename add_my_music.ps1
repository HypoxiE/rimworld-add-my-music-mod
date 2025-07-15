# Включаем кодировку UTF8 для консоли
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$lineBreak = [Environment]::NewLine

# Пути
$SongsGameplayXMLPath = "Defs\SongDefs"
$musicPath = "Sounds\Gameplay"

# Проверяем, что папка для xml существует, если нет — создаём
if (-not (Test-Path $SongsGameplayXMLPath)) {
	New-Item -ItemType Directory -Path $SongsGameplayXMLPath | Out-Null
}

if (Test-Path "$SongsGameplayXMLPath\Songs_Gameplay.xml") {
    $content = Get-Content -Path "$SongsGameplayXMLPath\Songs_Gameplay.xml" -Raw
} else {
    $content = ""
}

$allSongDefs = @()
if ($content -ne "") {
    $blockPattern = "<SongDef.*?</SongDef>"
    $allSongDefs = [regex]::Matches($content, $blockPattern, [System.Text.RegularExpressions.RegexOptions]::Singleline)
}

# Переменная для накопления текста
$xmlContent = @"
<?xml version="1.0" encoding="utf-8" ?>
<Defs>
"@

Get-ChildItem -Path $musicPath -File | ForEach-Object {
	$soundName = $_.BaseName
	$existingBlock = $null

	foreach ($block in $allSongDefs) {
		if ($block.Value -like "*<defName>$soundName</defName>*") {
			$existingBlock = $block.Value
			break
		}
	}

	if ($existingBlock) {
		Write-Output "Found existing block for $soundName"
		$xmlContent += "${lineBreak}$existingBlock${lineBreak}"
    } else {
		Write-Output "Added new block for $soundName"
		$xmlContent += @"
${lineBreak}<SongDef>
	<defName>$soundName</defName>
	<clipPath>Gameplay/$soundName</clipPath>

	<!--The probability of music appearing in the game-->
	<commonality>1.0</commonality>

	<!--Music volume-->
	<volume>1.0</volume>

	<!--If true, it only plays in a combat situation-->
	<tense>false</tense>

	<!--If you want to limit the time of day, delete '<!- -' and '- ->' of the desired option-->
	<!--<allowedTimeOfDay>Day</allowedTimeOfDay>-->
	<!--<allowedTimeOfDay>Night</allowedTimeOfDay>-->

	<!--Listing the seasons in which this song is played-->
	<allowedSeasons> <li>Winter</li><li>Spring</li><li>Summer</li><li>Fall</li> </allowedSeasons>
</SongDef>${lineBreak}
"@
    }
}

# Закрываем тег
$xmlContent += "</Defs>"

# Записать в файл одним вызовом
$xmlContent | Out-File -FilePath "$SongsGameplayXMLPath\Songs_Gameplay.xml" -Encoding utf8

Write-Host "Songs_Gameplay.xml overwritten. After restarting the game, music will be added."
Read-Host "Press Enter to exit"
