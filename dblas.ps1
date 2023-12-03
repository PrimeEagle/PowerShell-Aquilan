# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Load the alert scripts into the database."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$loadDir = "Alerts"
$loadArg = "-asload"
$db = Get-CaseAndVersion(Get-Location);
$message = "loading alert script into [$db]"
Import-DatabaseScriptDirectoryExists $loadDir $loadArg 
Import-DatabaseScripts $loadDir $loadArg $message


SetPowerShellTabLabel; 
# -----------------------------------------------------------------------------
