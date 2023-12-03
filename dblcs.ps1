# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Load the chart scripts into the database."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$loadDir = "Charts"
$loadArg = "-csload"
$db = Get-CaseAndVersion(Get-Location);
$message = "loading chart script into [$db]"
Import-DatabaseScriptDirectoryExists $loadDir $loadArg 
Import-DatabaseScripts $loadDir $loadArg $message


SetPowerShellTabLabel; 
# -----------------------------------------------------------------------------
