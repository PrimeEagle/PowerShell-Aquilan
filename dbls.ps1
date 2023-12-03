# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Execute the database update stored procedures command."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location);
$logfile = Get-LatestDatabaseLogFile
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


$buildSrcTime = [System.Diagnostics.Stopwatch]::StartNew()
$statusMessage = 'loading db - ' + (Get-ScriptName) 
WriteStatus $logFile $statusMessage

$svcDir = Get-DatabaseDirectory(Get-Location)
push-Location $svcDir
.\ExecuteAllSqlScripts.cmd StoredProcedures
if($LASTEXITCODE -ne 0) {
	WriteError "$statusMessage; see $logfile";
	SetPowerShellTabLabel 'error'
	exit 1
}

Pop-Location
$buildSrcTime.Stop();
WriteStatusWithDuration $logfile $statusMessage $buildSrcTime
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------
