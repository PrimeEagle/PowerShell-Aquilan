# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Load the threshold analyzer scripts into the database."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$loadDir = "Threshold"
$loadArg = "-taload"
$db = Get-CaseAndVersion(Get-Location);
$message = "loading threshold scripts into [$db]"
Import-DatabaseScriptDirectoryExists $loadDir $loadArg 
Import-DatabaseScripts $loadDir $loadArg $message


SetPowerShellTabLabel; 
# -----------------------------------------------------------------------------
