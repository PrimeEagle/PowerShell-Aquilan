# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Clear the web server cache."  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$postParams = @{username='super';moredata='user'}
$caseAndVersion = Get-CaseAndVersion(Get-Location)
$portNumber = Get-AppPortNumber
$url = "http://localhost:$portNumber/$caseAndVersion/Cache/ClearCache?gowebcc=cCbXV9v9Zj8shv"
Invoke-WebRequest -Uri $url -Method POST -Body $postParams 
# -----------------------------------------------------------------------------
