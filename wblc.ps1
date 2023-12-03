# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "List files already committed for this case."   `
		  -detailHelp  "Usage:  $(Get-ScriptName) [caseNumber] [[vtag1] [vtag2]]
                    No arguments - list files committed for current context
                    [caseNumber] - list files for caseNumber
                    [[vtag1] [vtag2]] - list comments between versions "  
# -----------------------------------------------------------------------------

$svnurl = Get-SvnUrl;
$svntag = $svnTagsUrlPrivate;

if($args.count -eq 2) {
	$vtag1 = $args[0];
	$vtag2 = $args[1];
	$bx1 = "${svntag}/${vtag1}"
	$bx2 = "${svntag}/${vtag2}"
	

   $b1 = $vtag1 | select-string -pattern '(.+)\.' | ForEach-Object {$_.Matches.Groups[1].Value}
   $b2 = $vtag2 | select-string -pattern '(.+)\.' | ForEach-Object {$_.Matches.Groups[1].Value}

   if($b1 -ne $b2) {
	   Write-Error 'tags must be on same branch.'
	   exit 1
   }

   svn info $bx1 *> null
   if($LASTEXITCODE -ne 0) {
	   Write-Error "tag not found: $vtag1"
	   exit 2
   }

   svn info $bx2 *> null
   if($LASTEXITCODE -ne 0) {
	   Write-Error "tag not found: $vtag2"
	   exit 3
   }


   $r1 = svn log -v --stop-on-copy $bx1 | Select-String -pattern '^r(.+?) \|' | ForEach-Object {$_.Matches.Groups[1].Value}
   $r2 = svn log -v --stop-on-copy $bx2 | Select-String -pattern '^r(.+?) \|' | ForEach-Object {$_.Matches.Groups[1].Value}

   #$o = svn log -v -r ${r1}:$r2 https://dev.aquilan.net/svn/aquilan/branches/$b1 | Select-String -pattern '^Case.*'

   $wbUrl = $(Get-SvnUrl) + $b1
   $o = svn log -v -r ${r1}:$r2 $wbUrl | Select-String -pattern '^Case.*'
   $o.Matches.Value | Sort-Object -unique
   exit 0;
}
# -----------------------------------------------------------------------------


$caseNumber = $args[0]
if(-not $caseNumber) {
	TestValidDirectory;
	SetPowerShellTabLabel;
	$caseNumber = Get-CaseNumber(Get-Location);
} 
	

$searchTerm = "Case ${caseNumber}:"
Write-Host svn log --verbose  --search `""$searchTerm"`" $svnurl
Set-Clipboard "svn log --verbose  --search `"$searchTerm`" $svnurl"
'svn log set to clipboard'
# & svn log --verbose  --search `""$searchTerm"`" $svnurl
# -----------------------------------------------------------------------------
