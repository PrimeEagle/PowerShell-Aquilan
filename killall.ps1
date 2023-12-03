# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Kill all processes associated with the context."
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$CaseAndVersion = Get-CaseAndVersion(Get-Location)
Get-Process devenv, ssms, tortoiseproc -ErrorAction SilentlyContinue | Where-Object {$_.MainWindowTitle -like "*$CaseAndVersion*"}  | Stop-Process   2> $null
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\killaqs.ps1");
. ($PSScriptRoot + "\killweb.ps1");
