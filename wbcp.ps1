# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp "Copy file from current Workbench context to another." `
          -detailHelp  "Usage:  $(Get-ScriptName) branch file" 
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


if ($args.Count -ne 2) {
        "Usage:  $(Get-ScriptName) branch file"
        exit 2
}
# -----------------------------------------------------------------------------


$branch = $args[0]
$file = $args[1]

if(-not (Test-Path $file)) {
	WriteError "file does not exist: $file"
	exit 1
}

$srcDir = Get-SrcDir
$sourceFileInfo = Get-Item $file
${sourceTopDir} = Get-CaseTopDirectory(Get-Location)
$caseAndVersion = Get-CaseAndVersion(Get-Location)
$version = $caseAndVersion.Split("_")[1]
$newCaseAndVersion = $caseAndVersion.Replace("_${version}_", "_${branch}_")
$targetTopDir = "${srcDir}${newCaseAndVersion}"
$targetFile = $sourceFileInfo.FullName.Replace(${sourceTopDir}, ${targetTopDir})
$targetDir = [System.IO.Path]::GetDirectoryName($targetFile)

if(-not (Test-Path $targetDir)) {
	WriteError "target directory does not exist: $targetDir"
	exit 1
}

if(-not (Test-Path $targetFile)) {
	"target file does not exist, creating $targetFile"
}

Copy-Item $sourceFileInfo.FullName $targetFile 
# -----------------------------------------------------------------------------
