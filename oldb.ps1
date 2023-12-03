# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Open database log file."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


#$logDir = Get-LogDirectory(Get-Location)
$logFile = Get-LatestDatabaseLogFile
if(Test-Path $logFile) {
	notepad $logFile
}
else {
	WriteError "database log file not found. file: ${logFile}"
}
# -----------------------------------------------------------------------------

