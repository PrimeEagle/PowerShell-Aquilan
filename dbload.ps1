# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
$detailHelp = @"
Usage:  $(Get-ScriptName) custom 
                    - custom is the database setup files directory name
Example:  $(Get-ScriptName) base 
"@
Show-Help -summaryHelp  "Create the database and load the install/setup files."   `
	  -detailHelp  $detailHelp
TestValidDirectory;
SetPowerShellTabLabel 
# -----------------------------------------------------------------------------


if ($args.Count -ne 1) {
	WriteError $detailHelp
        exit 2
}


. ($PSScriptRoot + "\killaqs.ps1");


$dbuser = Get-DbAdminUser
$dbpass = Get-DbAdminPass
$custom = $args[0]
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------

$path = Get-CaseTopDirectory(Get-Location)
$logFile = "$path/build.log"
$sw = [System.Diagnostics.Stopwatch]::StartNew()
$statusMessage = 'loading initial db - ' + (Get-ScriptName) 
WriteStatus $logFile $statusMessage


$svcDir = Get-DatabaseDirectory(Get-Location)
push-Location $svcDir
.\Invoke-AquilanService.ps1 $dbuser $dbpass $custom  -nostart
if($LASTEXITCODE -ne 0) {
	$logfile = Get-ChildItem "$path/log/database*.log" | Sort-Object LastWriteTime | Select-Object -last 1
	WriteError "$statusMessage; see $logfile";
	SetPowerShellTabLabel 'error'
	exit 1
}


. ($PSScriptRoot + "\goaqs.ps1");
if($LASTEXITCODE -ne 0) {
	WriteError "Examine the log files in the file:  $logfile"
	SetPowerShellTabLabel 'error'
	exit 1
}

Pop-Location
$sw.Stop();
WriteStatusWithDuration $logfile $statusMessage $sw
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------
