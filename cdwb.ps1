# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Change the directory to the workbench directory."   `
		  -detailHelp  "Usage:  $(Get-ScriptName)  [-d]
                    -d - Get case details, slower."
$host.ui.RawUI.WindowTitle = 'wb'
# -----------------------------------------------------------------------------

if($PSVersionTable.PSVersion.Major -lt 6) {
    $currentVersion = $PSVersionTable.PSVersion.Major;
    $currentVersion += "." + $PSVersionTable.PSVersion.Minor;
    WriteError "Unsupported version of PowerShell, version 6 or better.  Current version: ${currentVersion}"
    exit 6
}


[string]$showDetails = 'not'
if($args.Count -ge 1 -and $args[0] -eq '-d') {
	$showDetails = "-d"
}

$i = 0;
$srcDir = Get-SrcDir;
[System.Collections.ArrayList]$tempDirectories = get-childItem -path $srcDir -filter "c*" -attributes directory | 
		Sort-Object Name | 
		Select-Object -expandProperty Name  

[System.Collections.ArrayList]$cases = New-Object System.Collections.ArrayList($null);



$i = 0;
$newCase = New-Object CaseStatus
$newCase.index = $i++;
$newCase.fullPath = $srcDir
$cases.Add($newCase)  > $null

$tempDirectories | ForEach-Object { 
	$path = $srcDir + $_;
	if(IsValidDirectory($path)) {
		$newCase = New-Object CaseStatus
		$newCase.index = $i++;
		$newCase.fullPath = $path
		$newCase.invokeCommand = "$PSScriptRoot\wbdetail.ps1";
		$cases.Add($newCase) > $null
	}
}




Get-CaseStatusFromList $showDetails  $cases

$i = 0;
$cases | ForEach-Object {
	if($showDetails -eq '-d') {
	  "  {0:d2}  {1,-4}  {7,3}  {2,-9}  {3,-11}  {6, -15}  {4,-46}    {5,-45}" -f [int32]$i++ , $_.caseNumber , $_.assignee, $_.status, $_.fullPath, $_.displayPath, $_.customer, $_.filesToCommit
	} else {
	  "  {0:d2}  {1,-4}  {4,-46}    {5,-45}" -f [int32]$i++ , $_.caseNumber , $_.assignee, $_.status, $_.fullPath, $_.displayPath
	}
}


$selected = Read-Host 'Context'

$ss = -1;
if([int]::TryParse($selected, [ref] $ss) -and $ss -ge 0 -and $ss -lt $i) {
	Set-Location($srcDir)
	Set-Location($cases[$ss].fullPath)
	if($ss -gt 0) {
		SetPowerShellTabLabel;
	}
}
else {
	SetPowerShellTabLabel;
}
# -----------------------------------------------------------------------------
