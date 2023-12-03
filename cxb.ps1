# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Copy extract file to the bulk Loader directory."  `
		  -detailHelp  "Usage:  $(Get-ScriptName) extractFile " 
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


if ($args.Count -ne 1) {
        "Usage:  $(Get-ScriptName) extractFile"
        exit 2
}

$pmeFile = $args[0]
# -----------------------------------------------------------------------------


if(-not (test-path($pmeFile))) {
	WriteError "cannot find the file:  $pmeFile"
	exit 5
}


$targetDir = Get-BulkDirectory(Get-Location)
Copy-Item $pmeFile $targetDir
# -----------------------------------------------------------------------------
