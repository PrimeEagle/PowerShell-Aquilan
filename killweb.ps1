# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Kill the IIS Express process."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


Stop-Process -ProcessName iisexpress  2> $null
# -----------------------------------------------------------------------------

