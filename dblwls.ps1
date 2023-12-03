# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Load the watch list scripts into the database."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$loadDir = "WatchLists"
$loadArg = "-wlload"
$db = Get-CaseAndVersion(Get-Location);
$message = "loading watch list script into [$db]"
Import-DatabaseScriptDirectoryExists $loadDir $loadArg 
Import-DatabaseScripts $loadDir $loadArg $message


SetPowerShellTabLabel; 
# ---------------------------------------------------------------------------
