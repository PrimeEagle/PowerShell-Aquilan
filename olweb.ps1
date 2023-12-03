# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Open web server application log file."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$logDir = "C:\log"
$caseAndNumber = Get-CaseAndVersion(Get-Location)
$logFilePattern = "aquilan_${caseAndNumber}_*.log"
# $logFilePattern

$logFile = get-childitem -Path $logDir -Filter $logFilePattern | 
		Sort-Object LastWriteTime -Descending | 
		Select-Object FullName -First 1 
if($logFile) {
	& $textEditor $logFile.FullName
}
else {
	WriteError "no log file found. path: ${log}"
}
# -----------------------------------------------------------------------------

