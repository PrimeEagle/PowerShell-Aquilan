# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Start the TortoiseSVN Repository Browser."  `
		  -detailHelp  "Usage:  $(Get-ScriptName) [target] " 
# -----------------------------------------------------------------------------


if($null -eq $svnTortoiseProcExe -or (-not (Test-Path($svnTortoiseProcExe)))) {
	WriteError "Cannot find path svnTortoiseProcExe: $svnTortoiseProcExe"
	exit 1
}


if($null -eq $svnTagsUrlPrivate) {
	WriteError " svnTagsUrlPrivate: $svnTagsUrlPrivate"
	exit 1
}

$target = $args[0]
# -----------------------------------------------------------------------------

if($target) {
	$path = & svn info $target --show-item url
}
else {
	$path = $svnTagsUrlPrivate
}

& $svnTortoiseProcExe /command:repobrowser /path:$path
# -----------------------------------------------------------------------------
