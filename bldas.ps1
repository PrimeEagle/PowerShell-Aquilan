# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Build the Alert (Transformer, Chart, ...) Script code."  
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


. ($PSScriptRoot + "\killaqs.ps1");
SetPowerShellTabLabel (Get-ScriptName) 


Set-AppConfig($path);


$caseAndVersion = Get-CaseAndVersion(Get-Location);
$slnFile = $path + "\Aquilan-" + $caseAndVersion + ".sln"

Push-Location $path
if(Test-Path $slnFile) {
	$buildExe = Get-BuildExe(Get-Location)
	& $buildExe -nologo -D:configuration=Debug -D:configBuildFilename=config.wb.build setup  build.Aquilan.AlertScript.dll | out-file -append $logfile
	if($LASTEXITCODE -ne 0)
	{
		Pop-Location
		WriteError "building; see $logfile";
		SetPowerShellTabLabel 'error'
		exit 1
	}
	
	. ($PSScriptRoot + "\dblas.ps1");
	. ($PSScriptRoot + "\dblcs.ps1");
	. ($PSScriptRoot + "\dblts.ps1");
	. ($PSScriptRoot + "\dblwls.ps1");
}
else 
{
    WriteError "no solution file found."
}
Pop-Location
$buildSrcTime.Stop();
WriteStatusWithDuration $logfile $statusMessage $buildSrcTime
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------