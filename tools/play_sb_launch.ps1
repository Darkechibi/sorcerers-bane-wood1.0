<#
.SYNOPSIS
    Launch DOSBox-X using settings from tools/dosbox_launch.json.

.DESCRIPTION
    Builds the DOSBox-X command line from JSON so you can add -c commands
    without editing batch file escaping. Called by play_sb.bat in repo root.
#>
[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ToolsDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ToolsDir
$ConfigPath = Join-Path $ToolsDir "dosbox_launch.json"

if (-not (Test-Path $ConfigPath)) {
    throw "Missing $ConfigPath"
}

$cfg = Get-Content $ConfigPath -Raw | ConvertFrom-Json

function Resolve-RepoPath([string]$p) {
    if ([string]::IsNullOrWhiteSpace($p) -or $p -eq ".") {
        return $RepoRoot
    }
    if ([System.IO.Path]::IsPathRooted($p)) { return $p }
    return (Join-Path $RepoRoot $p)
}

$dosboxExe = $cfg.dosbox_exe -replace "/", "\"
if (-not (Test-Path $dosboxExe)) {
    throw "dosbox_exe not found: $dosboxExe`nEdit tools/dosbox_launch.json"
}

$workDir = Resolve-RepoPath ([string]$cfg.working_dir)
$gameDir = Resolve-RepoPath ([string]$cfg.game_dir)
$logName = [string]$cfg.logfile
if ([string]::IsNullOrWhiteSpace($logName)) { $logName = "sb_trace.log" }
$logPath = if ([System.IO.Path]::IsPathRooted($logName)) { $logName } else { Join-Path $RepoRoot $logName }

$drive = ([string]$cfg.drive_letter).Trim().ToLower()
if ($drive.Length -ne 1) { $drive = "d" }

$main = [string]$cfg.main_program
if ([string]::IsNullOrWhiteSpace($main)) { $main = "sb.exe" }

# Build argument list for DOSBox-X
$args = @()

# Debug logging flags (dosbox-x -helpdebug): -log-int21, -log-fileio, -console, etc.
if ($cfg.cli_debug_flags) {
    foreach ($flag in @($cfg.cli_debug_flags)) {
        if (-not [string]::IsNullOrWhiteSpace($flag)) {
            $args += $flag.Trim()
        }
    }
}

$args += "-workingdir", $workDir

foreach ($setLine in $cfg.extra_set_config) {
    $line = $setLine -replace "REPLACE_LOGFILE", $logPath
    $args += "-set"
    $args += $line
}

# mount d "C:\path with spaces\..."
$mountCmd = "mount $drive `"$gameDir`""
$args += "-c"
$args += $mountCmd

$cmdList = @()
if ($cfg.optional_commands) {
    $cmdList += @($cfg.optional_commands)
}
# Always switch to game drive and run main program last
$cmdList += "${drive}:"
$cmdList += $main

foreach ($c in $cmdList) {
    if ([string]::IsNullOrWhiteSpace($c)) { continue }
    $args += "-c"
    $args += $c
}

Write-Host "DOSBox-X: $dosboxExe"
Write-Host "Game dir (drive ${drive}:): $gameDir"
Write-Host "Log: $logPath"
if ($cfg.cli_debug_flags) {
    Write-Host "CLI debug flags: $($cfg.cli_debug_flags -join ' ')"
}
Write-Host "Commands:"
foreach ($c in $cmdList) { Write-Host "  -c $c" }
Write-Host ""

Start-Process -FilePath $dosboxExe -ArgumentList $args -WorkingDirectory $workDir
