<#
.SYNOPSIS
    Automate before/after backups for Sorcerer's Bane reconstruction.

.DESCRIPTION
    You play in DOSBox; this script copies game save/data files into a
    timestamped folder under captures/ so each session is self-contained.

    Typical workflow:
      1. Double-click capture_begin.bat (or: Begin -Label "one_fight")
      2. Play ONE action in-game (move, fight, loot, etc.)
      3. Double-click capture_end.bat
      4. Read captures/<session>/diff_report.md

    Files copied: USER.SBS, HALLFAME.*, *.SBC, *.INV, *.DUN, *.SBL, etc.
    See capture_config.json to customize.

.PARAMETER Action
    Begin  = start new session, copy files to .../before/
    End    = copy files to .../after/, run diff, clear active session
    Snap   = extra snapshot mid-session (e.g. after save state in DOSBox)
    Status = show active session folder
    List   = list recent capture sessions
    Note   = append a line to notes.txt (use with -Message)

.EXAMPLE
    .\capture_game_state.ps1 -Action Begin -Label "fight_hobgoblin"
    .\capture_game_state.ps1 -Action Note -Message "Used Kill, HP 16->8"
    .\capture_game_state.ps1 -Action End
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("Begin", "End", "Snap", "Status", "List", "Note")]
    [string] $Action,

    [string] $Label = "session",

    [string] $Message = "",

    [ValidateSet("before", "after", "snap")]
    [string] $Phase = "snap"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Repo root = parent of tools/
$ToolsDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ToolsDir

function Read-Config {
    $configPath = Join-Path $ToolsDir "capture_config.json"
    if (-not (Test-Path $configPath)) {
        throw "Missing $configPath"
    }
    $raw = Get-Content $configPath -Raw | ConvertFrom-Json
    $gameDir = $raw.game_dir
    if ($gameDir -eq "." -or [string]::IsNullOrWhiteSpace($gameDir)) {
        $gameDir = $RepoRoot
    } elseif (-not [System.IO.Path]::IsPathRooted($gameDir)) {
        $gameDir = Join-Path $RepoRoot $gameDir
    }
  $captureRoot = $raw.capture_root
    if ([string]::IsNullOrWhiteSpace($captureRoot)) { $captureRoot = "captures" }
    if (-not [System.IO.Path]::IsPathRooted($captureRoot)) {
        $captureRoot = Join-Path $RepoRoot $captureRoot
    }
    return [PSCustomObject]@{
        GameDir          = (Resolve-Path $gameDir).Path
        CaptureRoot      = $captureRoot
        FilePatterns     = @($raw.file_patterns)
        GlobPatterns     = @($raw.glob_patterns)
        DosboxSaveDir    = [string]$raw.optional_dosbox_save_dir
    }
}

function Get-ActiveSessionFile { param($CaptureRoot) Join-Path $CaptureRoot "_ACTIVE_SESSION.txt" }

function Get-SessionPaths {
    param($CaptureRoot, $SessionName)
    $base = Join-Path $CaptureRoot $SessionName
    return [PSCustomObject]@{
        Base   = $base
        Before = Join-Path $base "before"
        After  = Join-Path $base "after"
        Snaps  = Join-Path $base "snapshots"
        Notes  = Join-Path $base "notes.txt"
        Meta   = Join-Path $base "session.json"
        DiffMd = Join-Path $base "diff_report.md"
        DiffJs = Join-Path $base "diff_report.json"
    }
}

function Sanitize-Label {
    param([string]$s)
    $s = $s.Trim()
    if ([string]::IsNullOrWhiteSpace($s)) { return "session" }
    $s = $s -replace '[^\w\-]', '_'
    $s = $s -replace '_+', '_'
    if ($s.Length -gt 40) { $s = $s.Substring(0, 40) }
    return $s.ToLower()
}

function New-SessionName {
    param([string]$Label)
    $stamp = Get-Date -Format "yyyy-MM-dd_HHmmss"
    return "${stamp}_$(Sanitize-Label $Label)"
}

function Collect-SourceFiles {
    param($Config)
    $files = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($name in $Config.FilePatterns) {
        $p = Join-Path $Config.GameDir $name
        if (Test-Path $p) { [void]$files.Add((Resolve-Path $p).Path) }
    }
    foreach ($glob in $Config.GlobPatterns) {
        $matches = Get-ChildItem -Path $Config.GameDir -Filter $glob -File -ErrorAction SilentlyContinue
        foreach ($m in $matches) { [void]$files.Add($m.FullName) }
    }
    return @($files) | Sort-Object
}

function Copy-GameSnapshot {
    param(
        [string]$DestDir,
        [object]$Config,
        [string]$Tag
    )
    New-Item -ItemType Directory -Path $DestDir -Force | Out-Null
    $manifest = @()
    $sources = Collect-SourceFiles -Config $Config
    foreach ($src in $sources) {
        $leaf = Split-Path $src -Leaf
        $dest = Join-Path $DestDir $leaf
        Copy-Item -LiteralPath $src -Destination $dest -Force
        $manifest += [PSCustomObject]@{
            file = $leaf
            size = (Get-Item $dest).Length
            sha1 = (Get-FileHash -LiteralPath $dest -Algorithm SHA1).Hash
        }
    }
    # Optional DOSBox-X save slots
    if (-not [string]::IsNullOrWhiteSpace($Config.DosboxSaveDir) -and (Test-Path $Config.DosboxSaveDir)) {
        $slotDest = Join-Path $DestDir "dosbox_saves"
        New-Item -ItemType Directory -Path $slotDest -Force | Out-Null
        Get-ChildItem -Path $Config.DosboxSaveDir -File -ErrorAction SilentlyContinue | ForEach-Object {
            Copy-Item -LiteralPath $_.FullName -Destination (Join-Path $slotDest $_.Name) -Force
        }
    }
    $manifest | ConvertTo-Json -Depth 3 | Set-Content -Path (Join-Path $DestDir "_manifest.json") -Encoding UTF8
    Write-Host "[$Tag] Copied $($sources.Count) game file(s) -> $DestDir"
    if ($sources.Count -eq 0) {
        Write-Warning "No files matched. Is game_dir correct? $($Config.GameDir)"
    }
}

function Write-SessionMeta {
    param($Paths, $Label, $Phase)
    $meta = [ordered]@{
        label      = $Label
        created    = (Get-Date).ToString("o")
        phase      = $Phase
        game_dir   = (Read-Config).GameDir
        purpose    = "Sorcerer Bane reconstruction capture - one in-game action between before and after"
    }
    $meta | ConvertTo-Json | Set-Content -Path $Paths.Meta -Encoding UTF8
}

function Invoke-DiffReport {
    param($Paths)
    $py = Get-Command python -ErrorAction SilentlyContinue
    if (-not $py) {
        Write-Warning "python not found; skip auto-diff. Run manually: python tools/diff_snapshots.py"
        return
    }
    $diffScript = Join-Path $ToolsDir "diff_snapshots.py"
    if (-not (Test-Path $diffScript)) {
        Write-Warning "Missing diff_snapshots.py"
        return
    }
    & $py.Source $diffScript $Paths.Before $Paths.After --json-out $Paths.DiffJs --md-out $Paths.DiffMd
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Diff report: $($Paths.DiffMd)"
    }
}

function Append-Note {
    param($Paths, [string]$Text)
    $line = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')  $Text"
    Add-Content -Path $Paths.Notes -Value $line -Encoding UTF8
    Write-Host "Note appended to $($Paths.Notes)"
}

# --- main ---
$config = Read-Config
New-Item -ItemType Directory -Path $config.CaptureRoot -Force | Out-Null
$activeFile = Get-ActiveSessionFile -CaptureRoot $config.CaptureRoot

switch ($Action) {
    "Begin" {
        if (Test-Path $activeFile) {
            $existing = Get-Content $activeFile -Raw
            Write-Warning "Previous session still active: $existing"
            Write-Warning "Run capture_end.bat first, or delete $activeFile"
        }
        $sessionName = New-SessionName -Label $Label
        $paths = Get-SessionPaths -CaptureRoot $config.CaptureRoot -SessionName $sessionName
        New-Item -ItemType Directory -Path $paths.Base -Force | Out-Null
        Write-SessionMeta -Paths $paths -Label $Label -Phase "begin"
        Set-Content -Path $paths.Notes -Value @(
            "# Capture session: $sessionName",
            "# Label: $Label",
            "# Do ONE in-game action between begin and end, then fill notes below.",
            ""
        ) -Encoding UTF8
        Copy-GameSnapshot -DestDir $paths.Before -Config $config -Tag "BEFORE"
        Set-Content -Path $activeFile -Value $sessionName -Encoding UTF8
        Write-Host ""
        Write-Host "SESSION STARTED: $sessionName"
        Write-Host "Folder: $($paths.Base)"
        Write-Host "Now play ONE action, then run capture_end.bat"
    }
    "Snap" {
        if (-not (Test-Path $activeFile)) { throw "No active session. Run capture_begin.bat first." }
        $sessionName = Get-Content $activeFile -Raw
        $paths = Get-SessionPaths -CaptureRoot $config.CaptureRoot -SessionName $sessionName.Trim()
        $sub = Join-Path $paths.Snaps "$(Get-Date -Format 'HHmmss')_$Phase"
        Copy-GameSnapshot -DestDir $sub -Config $config -Tag "SNAP-$Phase"
        if ($Message) { Append-Note -Paths $paths -Text "snap/$Phase : $Message" }
    }
    "End" {
        if (-not (Test-Path $activeFile)) { throw "No active session. Run capture_begin.bat first." }
        $sessionName = (Get-Content $activeFile -Raw).Trim()
        $paths = Get-SessionPaths -CaptureRoot $config.CaptureRoot -SessionName $sessionName
        Copy-GameSnapshot -DestDir $paths.After -Config $config -Tag "AFTER"
        if ($Message) { Append-Note -Paths $paths -Text "end : $Message" }
        Invoke-DiffReport -Paths $paths
        Remove-Item -Path $activeFile -Force
        Write-Host ""
        Write-Host "SESSION COMPLETE: $sessionName"
        Write-Host "Review: $($paths.DiffMd)"
    }
    "Note" {
        if (-not (Test-Path $activeFile)) { throw "No active session." }
        $sessionName = (Get-Content $activeFile -Raw).Trim()
        $paths = Get-SessionPaths -CaptureRoot $config.CaptureRoot -SessionName $sessionName
        if (-not $Message) { $Message = Read-Host "Note" }
        Append-Note -Paths $paths -Text $Message
    }
    "Status" {
        if (-not (Test-Path $activeFile)) {
            Write-Host "No active capture session."
        } else {
            $sessionName = (Get-Content $activeFile -Raw).Trim()
            $paths = Get-SessionPaths -CaptureRoot $config.CaptureRoot -SessionName $sessionName
            Write-Host "Active: $sessionName"
            Write-Host "Folder: $($paths.Base)"
        }
    }
    "List" {
        Get-ChildItem -Path $config.CaptureRoot -Directory |
            Where-Object { $_.Name -notlike "_*" } |
            Sort-Object Name -Descending |
            Select-Object -First 15 |
            ForEach-Object { Write-Host $_.Name }
    }
}
