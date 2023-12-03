# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Kill the Aquilan Service process."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------

$CaseAndVersion = Get-CaseAndVersion(Get-Location)
Get-Process | Where-Object {$_.Path -like "*$CaseAndVersion*"}  | Stop-Process
# -----------------------------------------------------------------------------
