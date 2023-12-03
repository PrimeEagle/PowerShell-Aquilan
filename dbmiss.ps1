# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
$detailHelp = @"
Usage:  $(Get-ScriptName) [-h] -d
                    -d - drop databases with missing contexts; optional
                    -h - command line help 
Example:
     $(Get-ScriptName) [-d]
"@


Show-Help -summaryHelp "Show (option to drop) databases with missing Workbench context." `
          -detailHelp  $detailHelp
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

$args = $script:MyInvocation.UnboundArguments
if($args[0] -eq "-d") {  $drop = 1  }
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


$srcPath = Get-SrcDir
$wbContextList = ((get-childitem -file "$srcPath\*\caseinfo.xml").Directory).Name 
# -----------------------------------------------------------------------------


$dbListSql = "select name from sys.databases where name like 'c%' order by name "
$dbList = & sqlcmd -S $dbServerPrivate -U $dbAdminUser -P $dbAdminPass -d master -t 5 -Q "$dbListSql" | 
		ForEach-Object{ $_.Trim()}  |
		Select-String -Pattern "^c"  
# -----------------------------------------------------------------------------


$dbMiss = $dbList | Where-Object{$wbContextList -notcontains $_} 
# -----------------------------------------------------------------------------


if($drop) {
	$path = Get-CaseTopDirectory(Get-Location);
	$logFile = "$path/build.log"
	write-host -NoNewline '' | out-file -encoding ascii  $logFile 

	$dbMiss | ForEach-Object {
		$db = $_;
		Remove-Database $logfile $db
	}
} else {
    $dbMiss
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------