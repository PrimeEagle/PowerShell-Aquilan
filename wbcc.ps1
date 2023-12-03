# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Check for valid wbconf settings."
# -----------------------------------------------------------------------------


if($null -eq $basepathPrivate -or (-not (Test-Path ($basepathPrivate)))) {
	WriteError "Cannot find path basepathPrivate: $basepathPrivate"
	exit 1
}


if($null -eq $assetsPrivate -or (-not (Test-Path ($assetsPrivate)))) {
	WriteError "Cannot find path assetsPrivate: $assetsPrivate"
	exit 1
}


if($null -eq $devenvPrivate -or (-not (Test-Path ($devenvPrivate)))) {
	WriteError "Cannot find path devenvPrivate: $devenvPrivate"
	exit 1
}


if($null -eq $msbuildPrivate -or (-not (Test-Path ($msbuildPrivate)))) {
	WriteError "Cannot find path msbuildPrivate: $msbuildPrivate"
	exit 1
}


if ($null -eq (Get-Command $devenvPrivate -ErrorAction SilentlyContinue)) 
{ 
   WriteError "Unable to find $devenvPrivate in the environment PATH"
   exit 1
}



if($null -eq $iisExpressExe -or (-not (Test-Path ($iisExpressExe)))) {
	WriteError "Cannot find path iisExpressExe: $iisExpressExe"
	exit 1
}


if($null -eq $applicationHostConfigPrivate -or (-not (Test-Path ($applicationHostConfigPrivate)))) {
	WriteError "Cannot find path applicationHostConfigPrivate: $applicationHostConfigPrivate"
	exit 1
}


if($null -eq $ssmsPrivate -or (-not (Test-Path ($ssmsPrivate)))) {
	WriteError "Cannot find path ssmsPrivate: $ssmsPrivate"
	exit 1
}

if ($null -eq (Get-Command $ssmsPrivate -ErrorAction SilentlyContinue)) 
{ 
   WriteError "Unable to find $ssmsPrivate in the environment PATH"
   exit 1
}


if($null -eq $svnTortoiseProcExe -or (-not (Test-Path($svnTortoiseProcExe)))) {
	WriteError "Cannot find path svnTortoiseProcExe: $svnTortoiseProcExe"
	exit 1
}


if ($null -eq (Get-Command sqlcmd.exe -ErrorAction SilentlyContinue)) 
{ 
   WriteError "Unable to find sqlcmd.exe in the environment PATH, is SQL Server installed?"
   exit 1
}

& sqlcmd -S $dbServerPrivate -U $dbAdminUser -P $dbAdminPass -d master -t 5 -Q 'select * from sys.all_views' > $null
if($LASTEXITCODE -ne 0)
  {
    WriteError "Failed to connect to the database, check dbServerPrivate, dbAdminUser, and dbAdminPass"
    exit 1
  }


if ($null -eq (Get-Command "svn.exe" -ErrorAction SilentlyContinue)) 
{ 
   WriteError "Unable to find svn.exe in the environment PATH"
   exit 1
}


Get-Command svn.exe, sqlcmd.exe, $ssmsPrivate, $devenvPrivate, $msbuildPrivate, $iisExpressExe, $svnTortoiseProcExe    | Sort-Object -Property Name | Format-Table Name, Version


"No issues found while checking Workbench wbconf.ps1"
''

