; Classic Windows installer for Sorcerer's Bane wood1.0
; Build: ISCC.exe installer\SorcerersBane-wood1.0.iss

#define MyAppName "Sorcerer's Bane"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "wood1.0"
#define MyAppExeName "sbplay.exe"
#define MyAppId "{{A7C3E9F1-2B4D-4E6A-9C8F-1D2E3F4A5B6C}"

[Setup]
AppId={#MyAppId}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} wood{#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}\wood1.0
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=..\dist
OutputBaseFilename=SorcerersBane-wood1.0-Setup
SetupIconFile=
Compression=lzma2
SolidCompression=yes
WizardStyle=classic
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
UninstallDisplayName={#MyAppName} wood1.0
VersionInfoVersion=1.0.0.0
VersionInfoProductName={#MyAppName}
VersionInfoCompany={#MyAppPublisher}
ArchitecturesInstallIn64BitMode=x64compatible

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; Game binary + required data (virgin — no saves)
Source: "..\play\sbplay.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\play\ITEMFILE.DAT"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\play\MONSTER.DAT"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\play\SPELLS.DAT"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\play\SB.DAT"; DestDir: "{app}"; Flags: ignoreversion
; C source for the release bundle
Source: "..\play\sbplay.c"; DestDir: "{app}\source"; Flags: ignoreversion
Source: "..\README.md"; DestDir: "{app}"; Flags: ignoreversion isreadme

[Icons]
Name: "{group}\{#MyAppName} wood1.0"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"
Name: "{group}\Uninstall {#MyAppName} wood1.0"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#MyAppName} wood1.0"; Filename: "{app}\{#MyAppExeName}"; WorkingDir: "{app}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent; WorkingDir: "{app}"

[Code]
function InitializeSetup(): Boolean;
begin
  Result := True;
end;
