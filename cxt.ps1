# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
$detailHelp = @"
Usage:  $(Get-ScriptName) [-h] action
                    -h - command line help 
Action List:
	aa - Trigger Alert Analyzer Monitor
	an - Trigger Analytics Monitor
	dm - Trigger Dashboard Monitor
	em - Trigger Escalation Monitor
	ta - Trigger Threshold Analyzer
	wd - Trigger Watch List Download Monitor
	wv - Trigger Watch List Verification Monitor
	up - Trigger Unclaimed Property Monitor
	da - Trigger delete activities
	cs - Clear AQS log window
Example:
     $(Get-ScriptName) up
"@
Show-Help -summaryHelp  "Trigger an Aquilan Service action."  `
		  -detailHelp  $detailHelp


TestValidDirectory;
SetPowerShellTabLabel;
if ($args.Count -eq 0) {
	WriteError $detailHelp
    exit 2
}
# -----------------------------------------------------------------------------


Test-AqsRunning(Get-Location)
# -----------------------------------------------------------------------------

		  
$args1 = $script:MyInvocation.UnboundArguments
$action = $args1[0];  
$trigger = ''

switch($action)
{
	'up' { $trigger = 'exec	trigger	unclaimedproperty'}
	'aa' { $trigger = 'exec	trigger	alertanalyzerjob'}
	'an' { $trigger = 'exec	trigger	analytics'}
	'wd' { $trigger = 'exec	trigger	watchlistmonitorjob'}
	'wv' { $trigger = 'exec	trigger	watchlistreverify'}
	'ta' { $trigger = 'exec	trigger	thresholdanalyzerjob'}
	'em' { $trigger = 'exec	trigger	escalationmonitorjob'}
	'dm' { $trigger = 'exec	trigger	dashboardmonitorjob'}
	'da' { $trigger = 'exec	deleteallactivities'}
	'cs' { $trigger = 'exec	clearscreen'}
}

if($trigger.Length -eq 0) {
	WriteError $detailHelp
	exit 4
}
# -----------------------------------------------------------------------------


$targetDir = Get-101SourceDirectory(Get-Location)
$targetFile = "${targetDir}/action-${action}.txt"
$trigger | out-file -Encoding ascii $targetFile
# -----------------------------------------------------------------------------
