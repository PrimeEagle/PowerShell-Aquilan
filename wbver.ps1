# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Show Workbench version."  
# -----------------------------------------------------------------------------


$wbPath = $PSScriptRoot
$wbver = $wbPath + "\version.txt"
if(Test-Path $wbver) {
    Get-Content $wbver 
}
else {
	WriteError "Unable to find version file: ${wbver}"
}
# -----------------------------------------------------------------------------
