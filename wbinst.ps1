# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


$scriptName = [io.path]::GetFileNameWithoutExtension((split-path $script:MyInvocation.MyCommand.Name -Leaf));
$scriptPath = split-Path -Path $script:MyInvocation.MyCommand.Source 
$scriptParentPath = split-path -Leaf (split-Path -Path $scriptPath)

$args = $script:MyInvocation.UnboundArguments
if($args[0] -eq "-hh") { 
		$summaryHelp = "Perform the Workbench install / upgrade."
		$scriptName1 = $scriptName;
		$scriptName = $scriptName1.PadRight(9, " ");
		"    ${scriptName} - ${summaryHelp}";
		exit 0;

}
# ------------------------------------------------------------------------


if($scriptParentPath -eq "BuildTools") {
	# ------------------------------------------------------------------------
	# fresh install
	#

	$args = $script:MyInvocation.UnboundArguments
	if($args[0] -eq "-i") {  $path = $args[1];  }


	if($path.Length -eq 0) {
		'Error: invalid command line arguments'
		"Usage: ${scriptName} -i path";
		"       path - location to install"
		"Example: ${scriptName} -i D:\wb"
		exit 1
	}

	$binPath = $path + "/bin"
	$assetPath = $path + "/assets"
	if(Test-Path $binPath) {
		"Error: fresh install, but target bin directory already exists: ${binPath}"
		exit 1
	}
	if(-not (Test-Path $path)) {
			New-Item -ItemType directory $path  > $null
	}
	if(-not (Test-Path $binPath)) {
			New-Item -ItemType directory $binPath  > $null
	}
	if(-not (Test-Path $assetPath)) {
			New-Item -ItemType directory $assetPath  > $null
	}

	& robocopy $scriptPath $binPath /mir  /mt /xx   > $null
    "Installed Workbench - ${path} "
} else {
	# ------------------------------------------------------------------------
	# upgrade
	#
	
	. ($PSScriptRoot + "\wbcmn.ps1");
	if(-not $basepathPrivate) { exit 1; }
	TestValidDirectory;
	SetPowerShellTabLabel;
	# -----------------------------------------------------------------------------
	$srcPath = Get-CaseTopDirectory(Get-Location)
	$upgradePath = $srcPath + "/BuildTools/wb"
	if(-not (Test-Path($upgradepath))) {
		WriteError "Cannot not find the Workbench source directory: $upgradePath"
		exit 1
	}


	$targetPath = "$(Get-SrcDir)bin"
	& robocopy $upgradePath $targetPath /mir  /mt /xx   /njh /njs /xo
    "Upgraded Workbench - ${targetPath} "
}
# -----------------------------------------------------------------------------
