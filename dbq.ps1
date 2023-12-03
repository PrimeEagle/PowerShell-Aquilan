# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------



. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Execute database query." `
          -detailHelp  "Usage:  $(Get-ScriptName) query " 
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$aqs = Get-ServiceExe(Get-Location)
if ($args.Count -ne 1) {
        "Usage:  $(Get-ScriptName) query "
        exit 2
}
# -----------------------------------------------------------------------------


& $aqs -q $args
# -----------------------------------------------------------------------------