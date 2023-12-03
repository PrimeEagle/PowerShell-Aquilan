# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Start the Aquilan Service in the background."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$service =  Get-ServiceExe(Get-Location)
$path = Get-CaseTopDirectory(Get-Location)
$logFile = "$path/build.log"
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\killaqs.ps1");
. ($PSScriptRoot + "\dblas.ps1");
# -----------------------------------------------------------------------------


Start-Process $service  -argumentlist "-x -asdebug"
if($LASTEXITCODE -ne 0) {
	WriteError "Examine the log files in the file:  $logfile"
	SetPowerShellTabLabel 'error'
	exit 1
}
# -----------------------------------------------------------------------------
