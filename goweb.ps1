# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------




. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Start the web server application in the background."  `
          -detailHelp  "Usage:  $(Get-ScriptName) [-x] [-l] [-u username]
                    -x - Do not start IIS Express
                    -l - Auto login.
                    -u - User username to login. "  
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$startWithLogin = ($args -contains '-l');
$startWithUser = ($args -contains '-u');
if($startWithUser) {
    $startWithLogin = $false;
    $i = [array]::IndexOf($args, '-u');
    $userToUse = $args[$i+1];
    if($null -eq $userToUse) {
        $startWithUser = $false;
    }
}

if(-not ($args -contains '-x')) {
    Test-WebExe(Get-Location) 
    Start-IISExpress  
}
# -----------------------------------------------------------------------------


$caseAndVersion = Get-CaseAndVersion(Get-Location)
$portNumber = Get-AppPortNumber

if($startWithLogin) {
    $itUser = Get-ApmUser;
    $apmUser = $itUser  -replace '\..*$', ''
    $apmUserQueryString = "?u=$apmUser"
    $url = "http://localhost:$portNumber/$caseAndVersion/login.aspx$apmUserQueryString"
} elseif($startWithUser) {
    $apmUserQueryString = "?u=$userToUse"
    $url = "http://localhost:$portNumber/$caseAndVersion/login.aspx$apmUserQueryString"

} else {
    $url = "http://localhost:$portNumber/$caseAndVersion/logoff.aspx"
}
$url
Start-Process -FilePath $url 
# -----------------------------------------------------------------------------
