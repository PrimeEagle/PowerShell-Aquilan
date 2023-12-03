# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Drop the context database."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------

$db = Get-CaseAndVersion(Get-Location);
$path = Get-CaseTopDirectory(Get-Location);
$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


Remove-Database $logfile $db
# -----------------------------------------------------------------------------
