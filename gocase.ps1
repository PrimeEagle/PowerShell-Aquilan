# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Go to the Issue Tracker website and open the case."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$caseNumber = Get-TaskId(Get-Location);
$itUrl = IssueTracker;
#Start-Process ($itUrl + "?" + $caseNumber)
Start-Process ($itUrl + $caseNumber)
# -----------------------------------------------------------------------------
