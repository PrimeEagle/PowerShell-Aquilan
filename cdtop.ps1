# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Change the directory to the case top level directory."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$dir = Get-CaseTopDirectory(Get-Location)
if(Test-Path $dir) {
	Set-Location $dir
}
else {
	WriteError "scripts directory not found. file: ${dir}"
}
# -----------------------------------------------------------------------------
