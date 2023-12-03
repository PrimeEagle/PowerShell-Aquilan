# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Load the transformer scripts into the database."  
TestValidDirectory;
SetPowerShellTabLabel (Get-ScriptName) 
# -----------------------------------------------------------------------------


$loadDir = "Transformer"
$loadArg = "-tsload"
$db = Get-CaseAndVersion(Get-Location);
$message = "loading transformer script into [$db]"
Import-DatabaseScriptDirectoryExists $loadDir $loadArg 
Import-DatabaseScripts $loadDir $loadArg $message


SetPowerShellTabLabel; 
# -----------------------------------------------------------------------------
