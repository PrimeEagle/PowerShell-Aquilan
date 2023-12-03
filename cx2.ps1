# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Copy Cycle-2 extract file to the Loader."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


Test-AqsRunning(Get-Location)
# -----------------------------------------------------------------------------


$pmeFile = Join-Path (Get-DatabaseDirectory(Get-Location)) "pme/Cycle-2.pme"
if(-not (test-path($pmeFile))) {
	WriteError "cannot find the file: " + $pmeFile
	exit 5
}


$targetDir = Get-101SourceDirectory(Get-Location)
Copy-Item $pmeFile $targetDir
# -----------------------------------------------------------------------------
