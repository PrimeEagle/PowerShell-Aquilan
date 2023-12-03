# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
$detailHelp = @"
Usage:  $(Get-ScriptName) [-h] 
					-w - loads watch lists
                    -h - command line help 
Example:
     $(Get-ScriptName)
"@


Show-Help -summaryHelp "Updates from svn, loads base db config, and loads cx2. Optionally loads watch lists." `
          -detailHelp  $detailHelp
# -----------------------------------------------------------------------------

$watchlists = $false
$args = $script:MyInvocation.UnboundArguments
if($args[0] -eq "-w") {  $watchlists = $true }

if($help)
{
    WriteError $detailHelp;
    exit 2
}

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
		
& wbup
& wbsln
& bldaqs
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