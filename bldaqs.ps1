# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Build the aqs executable."  `
		  -detailHelp  "Usage:  $(Get-ScriptName)  [-m] [-s]
                    -m - Build using MSBuild, default uses nant.
                    -s - Start the Aquilan Service in the background after successful build."
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location)
$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


$buildSrcTime = [System.Diagnostics.Stopwatch]::StartNew()


. ($PSScriptRoot + "\killaqs.ps1");
SetPowerShellTabLabel (Get-ScriptName) 


$caseAndVersion = Get-CaseAndVersion(Get-Location);
$slnFile = $path + "\Aquilan-" + $caseAndVersion + ".sln"

Push-Location $path
if(Test-Path $slnFile) {

	if($args.Count -ge 1 -and $args[0] -eq '-m') {
		$statusMessage = 'building source; MSBuild - ' + (Get-ScriptName) 
		WriteStatus $logFile $statusMessage

        $buildExe = Get-MsBuildExe(Get-Location)
		$projectPath = $path + "\Aquilan.Service\Aquilan.Service.csproj"

		& $buildExe $projectPath -nologo  -t:Build | out-file -append $logfile
		if($LASTEXITCODE -ne 0)
		{
			Pop-Location
			WriteError "building; see $logfile";
			SetPowerShellTabLabel 'error'
			exit 1
		}
	}
	else {		
		$statusMessage = 'building source; nant - ' + (Get-ScriptName) 
		WriteStatus $logFile $statusMessage

		$buildExe = Get-BuildExe(Get-Location)
		& $buildExe -nologo -D:configuration=Debug -D:configBuildFilename=config.wb.build setup  build.Aquilan.Service.exe | out-file -append $logfile
		if($LASTEXITCODE -ne 0)
		{
			Pop-Location
			WriteError "building; see $logfile";
			SetPowerShellTabLabel 'error'
			exit 1
		}
	}
}
else 
{
    WriteError "no solution file found."
}
Pop-Location
$buildSrcTime.Stop();
WriteStatusWithDuration $logfile $statusMessage $buildSrcTime
# -----------------------------------------------------------------------------


if($args.Count -ge 1 -and $args[0] -eq '-s' -or $args[1] -eq '-s') {
	. ($PSScriptRoot + "\goaqs.ps1");
}
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------
