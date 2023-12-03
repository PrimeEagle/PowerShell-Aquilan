# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Remove the workbench context and database."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


function Remove-Context {


    . ($PSScriptRoot + "\killall.ps1");
    # -----------------------------------------------------------------------------


	$removeLocation = Get-CaseTopDirectory(Get-Location)

	& dbdrop
    # -----------------------------------------------------------------------------


	$sw = [System.Diagnostics.Stopwatch]::StartNew()
	Write-Host "$(Get-DateTime)| removing Workbench context ${removeLocation}"
	Set-Location(Get-SrcDir)
	remove-item -recurse -force $removeLocation 

	$sw.Stop();
	Write-Host "$(Get-DateTime)| ts: $($sw.Elapsed.ToString()); removing Workbench context"  
	get-childItem -filter "c*" -attributes directory | Sort-Object Name | Select-Object -expandProperty Name
	$host.ui.RawUI.WindowTitle = 'wb'
}
# -----------------------------------------------------------------------------


write-host "Remove this Workbench context? " -NoNewline
$readHost = Read-Host "[Y|n] " 
switch ($readHost) {
	Y { Remove-Context  }
	Default {write-host "Remove aborted.";}
}
# -----------------------------------------------------------------------------

