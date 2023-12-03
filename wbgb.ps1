# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
$detailHelp = @"
Usage:  $(Get-ScriptName) [-h] -v version -c caseNumber
                    -v - version; required 
                    -c - case number; required
                    -h - command line help 
Example:
     $(Get-ScriptName) -v v4.8.7.00043 -c 2586
"@


Show-Help -summaryHelp "Create new Workbench context, loads base db config, and loads cx2. Optionally loads watch lists." `
          -detailHelp  $detailHelp
# -----------------------------------------------------------------------------

$watchlists = $false
$args = $script:MyInvocation.UnboundArguments
if($args[0] -eq "-v") {  $version = $args[1];  }
if($args[2] -eq "-c") {  $caseNumber = $args[3];  }
if($args[2] -eq "-v") {  $version = $args[3];  }
if($args[0] -eq "-c") {  $caseNumber = $args[1];  }
if($args[4] -eq "-w") {  $watchlists = $true }

if($caseNumber.length -eq 0 -or $version.length -eq 0 -or $help)
{
    WriteError $detailHelp;
    exit 2
}

foreach($v in $version)
{
	if(-not $v.Trim().StartsWith("v")) {
		WriteError "version must start with the letter 'v'" 
		$detailHelp
	  exit 3
	}
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
foreach($c in $caseNumber)
{
	foreach($v in $version)
	{
		$vt = $v.Trim()
		
		& wbco -c $c -v $vt
		& dbload base
		Start-Sleep -Seconds 15
		
		if($watchlists)
		{
			& killaqs
			& aqs -Q "update TypeWatchList set [Enabled] = 0 where Id = 11"
			& aqs -w -b
			Start-Sleep -Seconds 180
			& goaqs
		}
		
		& cx2
		Start-Sleep -Seconds 180
		& killaqs
	}
}