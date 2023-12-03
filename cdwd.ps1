# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Change the directory to the ~/BuildTools/dc/wd directory."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$dir = Join-Path (Get-CaseTopDirectory(Get-Location)) "BuildTools\dc\wd"
if(Test-Path $dir) {
	Set-Location $dir
}
else {
	WriteError "scripts directory not found. file: ${dir}"
}
# -----------------------------------------------------------------------------

