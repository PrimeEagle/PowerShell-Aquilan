# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------



. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Execute the Aquilan Service in the foreground." `
          -detailHelp  "Usage:  $(Get-ScriptName) args " 
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$aqs = Get-ServiceExe(Get-Location)
if ($args.Count -eq 0) {
        "Usage:  $(Get-ScriptName) args "
        exit 2
}
# -----------------------------------------------------------------------------


& $aqs $args
# -----------------------------------------------------------------------------
