# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Build the web executables."   `
          -detailHelp  "Usage:  $(Get-ScriptName) [-m] [-s] [-l] [-u username]
                    -m - Build using MSBuild, default uses nant.
                    -s - Start the web server application in the background after successful build. 
                    -l - Start the web server application in the background after successful build and auto login.
                    -u - Start the web server application in the background after successful build and user username to login."
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location)
$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


$buildSrcTime = [System.Diagnostics.Stopwatch]::StartNew()


$caseAndVersion = Get-CaseAndVersion(Get-Location);
$slnFile = $path + "\Aquilan-" + $caseAndVersion + ".sln"

Push-Location $path
if(Test-Path $slnFile) {
	if($args.Count -ge 1 -and $args[0] -eq '-m') {
        $statusMessage = 'building source; MSBuild - ' + (Get-ScriptName) 
        WriteStatus $logFile $statusMessage

        $buildExe = Get-MsBuildExe(Get-Location)
		$projectPath = $path + "\PatriotManager\PatriotManager.csproj"

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
        & $buildExe -nologo -D:configuration=Debug -D:configBuildFilename=config.wb.build setup  build.Aquilan.Web.dll | out-file -append $logfile
        if($LASTEXITCODE -ne 0)
        {
            Pop-Location
            WriteError "$statusMessage; see $logfile";
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


$caseAndVersion = Get-CaseAndVersion(Get-Location)
$portNumber = Get-AppPortNumber


if($args.Count -ge 1 -and $args[0] -eq '-s' -or $args[1] -eq '-s') {
	Test-WebExe(Get-Location) 
	Start-IISExpress  
    $url = "http://localhost:$portNumber/$caseAndVersion/logoff.aspx"
    Start-Process -FilePath $url 
}
elseif($args.Count -ge 1 -and $args[0] -eq '-l' -or $args[1] -eq '-l') {
	Test-WebExe(Get-Location) 
	Start-IISExpress  
    $itUser = Get-ApmUser;
    $apmUser = $itUser  -replace '\..*$', ''
    $apmUserQueryString = "?u=$apmUser"
    $url = "http://localhost:$portNumber/$caseAndVersion/login.aspx$apmUserQueryString"
    Start-Process -FilePath $url 
} elseif($args.Count -eq 2 -and $args[0] -eq '-u') {
	Test-WebExe(Get-Location) 
	Start-IISExpress  
    $apmUser = $args[1]
    $apmUserQueryString = "?u=$apmUser"
    $url = "http://localhost:$portNumber/$caseAndVersion/login.aspx$apmUserQueryString"
    Start-Process -FilePath $url 
} elseif($args.Count -eq 3 -and $args[1] -eq '-u') {
	Test-WebExe(Get-Location) 
	Start-IISExpress  
    $apmUser = $args[2]
    $apmUserQueryString = "?u=$apmUser"
    $url = "http://localhost:$portNumber/$caseAndVersion/login.aspx$apmUserQueryString"
    Start-Process -FilePath $url 
}
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------
