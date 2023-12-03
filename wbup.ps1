# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Execute the svn update command at the top level."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$caseInfo = Get-CaseAndVersion (Get-Location)
$srcdir = Get-SrcDir
$path = join-path $srcdir  $caseInfo
$dir = Get-Item $path
& svn up $dir
$wbcpl = ($PSScriptRoot + "\wbcpl.ps1");
& $wbcpl 
# -----------------------------------------------------------------------------
