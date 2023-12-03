
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Build the entire solution including data access."  `
		  -detailHelp  "Usage:  $(Get-ScriptName) [-s]
                    -s - Execute dbload base; start the Aquilan Service in the background; execute cx2 after successful build." 
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location)
Set-Location $path 

$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


$buildSrcTime = [System.Diagnostics.Stopwatch]::StartNew()
WriteStatus $logFile 'building all source'


. ($PSScriptRoot + "\killaqs.ps1");
SetPowerShellTabLabel (Get-ScriptName) 


Set-AppConfig($path);


$buildExe = Get-BuildExe(Get-Location)
& $buildExe -nologo -D:configBuildFilename=config.wb.build initial | out-file -append $logfile
if($LASTEXITCODE -ne 0)
{
  WriteError "building; see $logfile";
  "The .\BuildAll.cmd command can be used to continue."
}

$buildSrcTime.Stop();
WriteStatusWithDuration $logfile "building all source"  $buildSrcTime
# -----------------------------------------------------------------------------


if($args.Count -eq 1 -and $args[0] -eq '-s') {
  SetPowerShellTabLabel;
	. ($PSScriptRoot + "\dbload.ps1") "base";

  SetPowerShellTabLabel;
	. ($PSScriptRoot + "\goaqs.ps1");

  SetPowerShellTabLabel;
  start-sleep -seconds 5
	. ($PSScriptRoot + "\cx2.ps1");

  SetPowerShellTabLabel;
	. ($PSScriptRoot + "\goweb.ps1") "-l";
}


SetPowerShellTabLabel;
# -----------------------------------------------------------------------------

