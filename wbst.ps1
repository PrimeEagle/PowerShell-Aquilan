# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Execute the svn status command."  
# -----------------------------------------------------------------------------

function Perform($dir)
{
	$base = Get-SrcDir
	$rv = [System.IO.Path]::GetFullPath($base + "/" + $dir.Name + "/caseinfo.xml") + "`n";
	$filestatus = svn st -q $dir
	foreach($f in  $filestatus)
	{
		if(IgnoreFile($f)) {  continue;  }
		$rv += $f + "`n";
	}
	$rv += '' + "`n";
	return $rv
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


if(IsValidDirectory (Get-Location)) {
	$caseInfo = Get-CaseAndVersion (Get-Location)
	$srcdir = Get-SrcDir
	$path = join-path $srcdir  $caseInfo
	$dir = Get-Item $path
	$output = Perform $dir
	write-host $output
}
else {
	$base = Get-SrcDir;
	foreach  ($dir in Get-ChildItem $base) {
		if(IsValidDirectory $dir) {
			$output = Perform $dir 
			write-host $output
		}
	}
}
# -----------------------------------------------------------------------------

