# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Change the directory to the ~/database/Scripts directory."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$dir = Get-DatabaseDirectory(Get-Location)
if(Test-Path $dir) {
	Set-Location $dir
}
else {
	WriteError "database directory not found. file: ${dir}"
}
# -----------------------------------------------------------------------------

