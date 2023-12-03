# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
if ($args.Length -eq 1 -and $args[0] -eq '-hh') {
	Show-Help -summaryHelp  "Show Workbench command summary."  
}
# -----------------------------------------------------------------------------


'Workbench Commands'
Get-ChildItem $PSScriptRoot -Filter "*.ps1" | Sort-Object Name | Foreach-Object -Process {
	if($_.Name -eq "wbcmn.ps1") { return }
	if($_.Name -eq "wbsln.ps1") { return }

	& $_.FullName -hh
} 
# -----------------------------------------------------------------------------

