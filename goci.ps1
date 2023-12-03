# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Start the TortoiseSVN commit dialog."
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


if($null -eq $svnTortoiseProcExe -or (-not (Test-Path($svnTortoiseProcExe)))) {
	WriteError "Cannot find path svnTortoiseProcExe: $svnTortoiseProcExe"
	exit 1
}


if($null -eq $svnTagsUrlPrivate) {
	WriteError " svnTagsUrlPrivate: $svnTagsUrlPrivate"
	exit 1
}

#  get $comment from caseinfo.xml (get last title)
#  add  /logmsg:"$comment" to commit command
#  add this to wbci as well

$message = Get-CaseTitle(Get-Location)
$message
$path = Get-CaseTopDirectory(Get-Location)
& $svnTortoiseProcExe /command:commit /logmsg:`""${message}"`" /path:`""$path`""
# -----------------------------------------------------------------------------

