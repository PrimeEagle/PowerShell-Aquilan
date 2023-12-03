# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Start the TortoiseSVN log dialog."  `
		  -detailHelp  "Usage:  $(Get-ScriptName) file " 
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


if ($args.Count -ne 1) {
        "Usage:  $(Get-ScriptName) file"
        exit 2
}

$file = $args[0]
# -----------------------------------------------------------------------------


if($null -eq $svnTortoiseProcExe -or (-not (Test-Path($svnTortoiseProcExe)))) {
	WriteError "Cannot find path svnTortoiseProcExe: $svnTortoiseProcExe"
	exit 1
}


if($null -eq $svnTagsUrlPrivate) {
	WriteError " svnTagsUrlPrivate: $svnTagsUrlPrivate"
	exit 1
}


& $svnTortoiseProcExe /command:log /path:"$file"
# -----------------------------------------------------------------------------

