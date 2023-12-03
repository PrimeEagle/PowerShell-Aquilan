# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Change the directory to the case artifacts directory."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$dir = Get-CaseWorkDirectory(Get-Location)
if(Test-Path $dir) {
	Set-Location $dir
}
else {
	WriteError "work directory not found. file: ${dir}"
}
# -----------------------------------------------------------------------------

