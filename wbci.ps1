# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------

function CommitFiles($srcdir)
{
	$files =  FilesToCommit($srcdir)
	$message = Get-CaseTitle(Get-Location)
	$rv = "svn ci --message '$message' ```n$files `n"
	return $rv;
} 
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Execute the svn checkin command."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$caseInfo = Get-CaseAndVersion (Get-Location)
$srcdir = Get-SrcDir
$path = join-path $srcdir  $caseInfo
$dir = Get-Item $path
$output = CommitFiles $dir
write-host $output
# -----------------------------------------------------------------------------
