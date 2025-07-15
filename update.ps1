# Указываем ссылки и пути
$repoUrl = "https://github.com/HypoxiE/rimworld-add-my-music-mod/archive/refs/heads/main.zip"
$zipPath = "$env:TEMP\add_my_music.zip"
$extractPath = "$env:TEMP\add_my_music_temp"

# Скачиваем и распаковываем архив
Write-Host "[INFO] Downloading mod from GitHub..."
Invoke-WebRequest -Uri $repoUrl -OutFile $zipPath
Write-Host "[INFO] Extracting..."
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

# список исключений (имена без пути)
$keepFolders = @(".git", "Defs", "Sounds")
$keepFiles = @()

Write-Host "[INFO] Uninstall old files..."
Get-ChildItem -Path $path -Directory | Where-Object { $keepFolders -notcontains $_.Name } | Remove-Item -Recurse -Force
Get-ChildItem -Path $path -File | Where-Object { $keepFiles -notcontains $_.Name } | Remove-Item -Force

Write-Host "[INFO] Installing new files..."
Copy-Item -Path "$extractPath\rimworld-add-my-music-mod-main\*" -Destination "." -Recurse -Force

# Удаляем временные файлы
Write-Host "[INFO] Cleaning up..."
Remove-Item $zipPath
Remove-Item $extractPath -Recurse -Force