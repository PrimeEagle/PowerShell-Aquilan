# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Copy regression test extract file to Loader."   `
		  -detailHelp  "Usage:  $(Get-ScriptName) extractFile " 
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


if ($args.Count -ne 1) {
        'Usage:  ' + $myInvocation.MyCommand.Name + ' extractFile'
        exit 2
}
# -----------------------------------------------------------------------------


Test-AqsRunning(Get-Location)
# -----------------------------------------------------------------------------


$path = Get-DatabaseDirectory(Get-Location) 
$pmeFile = $path  + "\regress\" + $args[0]
if(-not (test-path($pmeFile))) {
	WriteError "cannot find the file:  $pmeFile"
	exit 5
}


$targetDir = Get-101SourceDirectory(Get-Location)
Copy-Item $pmeFile $targetDir
# -----------------------------------------------------------------------------