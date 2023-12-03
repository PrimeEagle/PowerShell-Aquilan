# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Start the SQL Server Management Studio application." `
          -detailHelp  `
@"
Usage:  $(Get-ScriptName) [sqlfile] 
            If no sqlfile, then the ~/scripts/cases/c$(Get-CaseNumber(Get-Location))/queries.sql file is used 
"@ 
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$ssmsPath = Get-SsmsPath;
if(-not (Test-Path($ssmsPath))) {
    WriteError "could not find SSMS executable; file: ${ssmspath}"
    exit 5
}


if ($args.Count -eq 1) {
    $queryFile = $args[0]
} else  {
    $caseDir = Get-CaseTopDirectory(Get-Location);
    $caseNumber = Get-CaseNumber(Get-Location);
    $queryFile = $caseDir + "/scripts/cases/c${caseNumber}/queries.sql"
}

$serverName = Get-DbServer 
$dbName = Get-CaseAndVersion(Get-Location);



if(Test-Path $queryFile) {
    & $ssmsPath  -S $serverName -d $dbName $queryFile
}
else {
    WriteError "no query file found. file: ${queryFile}"
}
# -----------------------------------------------------------------------------

