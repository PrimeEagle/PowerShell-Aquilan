# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Build the aqs & web executables."  `
		  -detailHelp  "Usage:  $(Get-ScriptName)  [-m] 
                    -m - Build using MSBuild, default uses nant."
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location)
$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


$buildExeTime = [System.Diagnostics.Stopwatch]::StartNew()
$statusMessage = 'building source - ' + (Get-ScriptName) 
WriteStatus $logFile $statusMessage

if($args.Count -eq 1 -and $args[0] -eq '-m') {
	& ($PSScriptRoot + "\bldweb.ps1") -m;
		if($LASTEXITCODE -ne 0)
		{
			exit 1
		}
	& ($PSScriptRoot + "\bldaqs.ps1") -m;

}
else {
	& ($PSScriptRoot + "\bldweb.ps1");
		if($LASTEXITCODE -ne 0)
		{
			exit 1
		}
	& ($PSScriptRoot + "\bldaqs.ps1");

}


$buildExeTime.Stop();
WriteStatusWithDuration $logfile $statusMessage $buildExeTime
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------
