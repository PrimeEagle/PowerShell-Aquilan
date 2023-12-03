# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------



. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Upgrade Workbench scripts from source control." 
# -----------------------------------------------------------------------------


$svnPath = "v5.1.0/BuildTools/wb"


$wbUrl = $(Get-SvnUrl) + $svnPath
$wbBin = join-Path $(Get-SrcDir) "bin"
remove-item $(join-Path $wbBin "*.*")   -exclude wbconf.ps1,wbrest.ps1,RDCMan.exe,wbcmn.ps1
svn export --force $wbUrl $wbBin
#   svn export --force https://dev.aquilan.net/svn/aquilan/branches/v5.0.0/BuildTools/wb D:/wb/bin
# -----------------------------------------------------------------------------
