# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Display the workbench details."   `
		  -detailHelp  "Usage:  $(Get-ScriptName) path "
#$host.ui.RawUI.WindowTitle = 'wb'
# -----------------------------------------------------------------------------


if ($args.Count -ne 1) {
        "Usage:  $(Get-ScriptName) path"
        exit 2
}
# -----------------------------------------------------------------------------

$path = $args[0];
if(IsValidDirectory($path)) {
    $case = New-Object CaseStatus
    $case.index = $i++;
    $case.fullPath = $path

    $caseTitle = Get-CaseTitle $case.fullPath; 
    $caseNumber = $caseTitle.substring(5, 4)
    $case.caseNumber = $caseNumber
    $caseTitleLen = $caseTitle.Length -gt 95 ? 95 : $caseTitle.Length;
    $case.displayPath = ($case.fullPath.substring(0, $len), $caseTitle.substring(0, $caseTitleLen)).Trim();

    $temp = Get-CaseStatus $caseNumber
    $case.assignee = $temp.assignee
    $case.status = $temp.status
    $case.customer = $temp.customer
    $case.filesToCommit = FilesToCommitCount $case.fullPath
}

return $case
# -----------------------------------------------------------------------------
