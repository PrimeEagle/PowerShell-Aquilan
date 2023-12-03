# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Copy delete activities trigger file to the Loader."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


& ($PSScriptRoot + "\cxt.ps1") "da"
Start-Sleep -seconds 1
# -----------------------------------------------------------------------------
