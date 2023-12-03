# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Open build log file."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$logDir = Get-CaseTopDirectory(Get-Location)
$logFile = "${logDir}\build.log"
if(Test-Path $logFile) {
	& $textEditor $logFile
}
else {
	WriteError "source log file not found. file: ${logFile}"
}
# -----------------------------------------------------------------------------

