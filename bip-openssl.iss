; -- bip-openssl.iss --
; Windows OpenSSL installer
;

#define MyAppName "bip-openssl"
#define MyAppGroup "bip"
#define MyAppVersion "3.5.9"

[Setup]
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppCopyright=Copyright (c) 2026 Laurent Magan
LicenseFile=LICENSE
WizardStyle=modern dynamic
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppGroup}
Compression=lzma2
SolidCompression=yes
ChangesEnvironment=yes
PrivilegesRequired=lowest
OutputBaseFilename={#MyAppName}-{#MyAppVersion}

[Files]
Source: "{#MyAppName}-{#MyAppVersion}-dist\*"; DestDir: "{app}"; Flags: recursesubdirs

[Registry]
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "OPENSSL_CONF"; ValueData: "{app}\ssl"; Flags: preservestringtype uninsdeletevalue
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "OPENSSL_CONF_INCLUDE"; ValueData: "{app}\include"; Flags: preservestringtype uninsdeletevalue
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "OPENSSL_MODULES"; ValueData: "{app}\lib64\ossl-modules"; Flags: preservestringtype uninsdeletevalue
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "OPENSSL"; ValueData: "{app}\bin\openssl.exe"; Flags: preservestringtype uninsdeletevalue
Root: HKCU; Subkey: "Environment"; ValueType:expandsz; ValueName: "Path"; ValueData: "{olddata};{app}{\}bin"; Check: NeedsAddPathHKCU(ExpandConstant('{app}'))

[Code]
function NeedsAddPathHKCU(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  // look for the path with leading and trailing semicolon
  // Pos() returns 0 if not found
  Result := Pos(';' + Param + '\bin;', ';' + OrigPath + ';') = 0;
end;

