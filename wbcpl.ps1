# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Cleanup Product Line files after svn update."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$path = Get-CaseTopDirectory(Get-Location)
Set-Location $path 

$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
# -----------------------------------------------------------------------------


WriteStatus $logFile 'clean Product Line source'
$buildExe = Get-BuildExe(Get-Location)
& $buildExe -nologo setup -D:configBuildFilename=config.wb.build AssemblePatriotManagerMain | out-file -append $logfile
if($LASTEXITCODE -ne 0) {
  WriteError "cleaning Product Line; see $logfile";
  exit 1
}
# -----------------------------------------------------------------------------
