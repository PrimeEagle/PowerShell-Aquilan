# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Build the TypeScript code."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location)
$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


$buildSrcTime = [System.Diagnostics.Stopwatch]::StartNew()
$statusMessage = 'building source - ' + (Get-ScriptName) 
WriteStatus $logFile $statusMessage


$websrc = "$path/PatriotManager"
$tsc = Get-TscExe(Get-Location)
Push-Location $websrc
if(Test-Path $tsc) {
	& $tsc -p . | out-file -encoding ascii -append $logfile
	if($LASTEXITCODE -ne 0)
	{
		Pop-Location
		WriteError "$statusMessage; see $logfile";
		SetPowerShellTabLabel 'error'
		exit 1
	}
}
else 
{
    WriteError "no compiler found: $tsc"
}


Pop-Location
$buildSrcTime.Stop();
WriteStatusWithDuration $logfile $statusMessage $buildSrcTime
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------
