# Download the official Godot 4.7.2 (Windows x86_64) editor into this folder.
$ErrorActionPreference = "Stop"

$Version = "4.7.2-stable"
$File    = "Godot_v4.7.2-stable_win64.exe.zip"
$Url     = "https://github.com/godotengine/godot-builds/releases/download/$Version/$File"

$Dir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $Dir

Write-Host "Downloading Godot $Version (Windows x86_64)..."
Invoke-WebRequest -Uri $Url -OutFile $File
Expand-Archive -Path $File -DestinationPath . -Force

Write-Host "Done. Run: .\Godot_v4.7.2-stable_win64.exe"
