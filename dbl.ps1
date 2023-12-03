# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Execute the database upgrade command."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location);
$logfile = Get-LatestDatabaseLogFile
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


$buildSrcTime = [System.Diagnostics.Stopwatch]::StartNew()
$statusMessage = 'Loading db - ' + (Get-ScriptName) 
WriteStatus $logFile $statusMessage

$svcDir = Get-DatabaseDirectory(Get-Location)
push-Location $svcDir
.\UpgradeDatabase.cmd
if($LASTEXITCODE -ne 0) {
	$logfile = Get-LatestDatabaseLogFile
	WriteError "$statusMessage; see $logfile";
	SetPowerShellTabLabel 'error'
	exit 1
}

Pop-Location
$buildSrcTime.Stop();
WriteStatusWithDuration $logfile $statusMessage $buildSrcTime
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------
