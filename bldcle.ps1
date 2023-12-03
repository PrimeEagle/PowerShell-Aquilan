# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Clean the solution."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location)
Set-Location $path 

$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


$buildSrcTime = [System.Diagnostics.Stopwatch]::StartNew()
WriteStatus $logFile 'build clean'


$srcdir = Get-CaseTopDirectory(Get-Location)
$caseAndVersion = Get-CaseAndVersion(Get-Location);
$slnFile = $srcdir + "\Aquilan-" + $caseAndVersion + ".sln"

Push-Location $srcdir
if(Test-Path $slnFile) {
	$buildExe = Get-BuildExe(Get-Location)
	& $buildExe -nologo -D:configBuildFilename=config.wb.build setup clean.build | out-file -append $logfile
	if($LASTEXITCODE -ne 0)
	{
		WriteError "building; see $logfile";
	}
}
else 
{
    WriteError "no solution file found."
}
Pop-Location
$buildSrcTime.Stop();
WriteStatusWithDuration $logfile "build clean"  $buildSrcTime
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------