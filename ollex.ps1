# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Open Loader error log file."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$logDir = Get-LogDirectory(Get-Location)
$errDir = "${logDir}\error"
if(Test-Path $errDir) {
	$errFile = get-childitem -Path $errDir -Filter "Error-*log" | 
			Sort-Object LastWriteTime -Descending | 
			Select-Object FullName -First 1 
	if($errFile) {
		& $textEditor $errFile.FullName
	}
	else {
		WriteError "no error file found. path: ${errDir}"
	}
}
else {
	WriteError "error directory not found. path: ${errDir}"
}
# -----------------------------------------------------------------------------


