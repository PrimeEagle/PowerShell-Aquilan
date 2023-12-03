# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Generate the data access code."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location)
$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


$buildSrcTime = [System.Diagnostics.Stopwatch]::StartNew()
$statusMessage = 'generating data access - ' + (Get-ScriptName) 
WriteStatus $logFile $statusMessage


Set-AppConfig($path);


$caseAndVersion = Get-CaseAndVersion(Get-Location);
$slnFile = $path + "\Aquilan-" + $caseAndVersion + ".sln"

Push-Location $path
if(Test-Path $slnFile) {
	$buildExe = Get-BuildExe(Get-Location)
	& $buildExe -nologo -D:configBuildFilename=config.wb.build setup generate.dataaccess | out-file -append $logfile
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
		WriteError "building failed; no solution file found."
}
Pop-Location
$buildSrcTime.Stop();
WriteStatusWithDuration $logfile $statusMessage $buildSrcTime
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------
