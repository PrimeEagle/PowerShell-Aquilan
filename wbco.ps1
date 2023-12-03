# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
$detailHelp = @"
Usage:  $(Get-ScriptName) [-h] -v version -c caseNumber
                    -v - version; required 
                    -c - case number; required
                    -h - command line help 
Example:
     $(Get-ScriptName) -v v4.8.7.00043 -c 2586
"@


Show-Help -summaryHelp "Create new Workbench context." `
          -detailHelp  $detailHelp
# -----------------------------------------------------------------------------

$args = $script:MyInvocation.UnboundArguments
if($args[0] -eq "-v") {  $version = $args[1];  }
if($args[2] -eq "-c") {  $caseNumber = $args[3];  }
if($args[2] -eq "-v") {  $version = $args[3];  }
if($args[0] -eq "-c") {  $caseNumber = $args[1];  }

if($caseNumber.length -eq 0 -or $version.length -eq 0 -or $help)
{
    WriteError $detailHelp;
    exit 2
}

if(-not $version.startswith("v")) {
    WriteError "version must start with the letter 'v'" 
    $detailHelp
  exit 3
}
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


Function Remove-InvalidFileNameChars {
  param(
    [Parameter(Mandatory=$true,
      Position=0,
      ValueFromPipeline=$true,
      ValueFromPipelineByPropertyName=$true)]
    [String]$Name
  )

  $invalidChars = [IO.Path]::GetInvalidFileNameChars() -join '_'
  $re = "[{0}]" -f [RegEx]::Escape($invalidChars)
  return ($Name -replace $re)
}
# -----------------------------------------------------------------------------


#$basepath    = 'D:\wb\'
#$basesvnurl  = 'https://bld00.aquilan.atx/svn/aquilan/branches/'

$basepath = Get-SrcDir;
$basesvnurl = Get-SvnUrl;
$svnurl = $basesvnurl + $version;
# -----------------------------------------------------------------------------

$totalTime = [System.Diagnostics.Stopwatch]::StartNew()



$caseUrl   = IssueTrackerApi
$loginCred = Get-IssueTrackerPass
$loginTeamId = Get-IssueTrackerUser

$caseNumber = $caseNumber -replace 'DEV-', ''
$itLoginUrl = $caseUrl + 'DEV-' + $caseNumber + '?custom_task_ids=true&team_id=' + $loginTeamId


$Header = @{
	'Authorization' = $loginCred
}



try { $response = Invoke-WebRequest -Uri  $itLoginUrl -ContentType 'application/json' -Headers $Header }
catch {	
	WriteError $_.Exception.Message
	WriteError 'Perhaps invalid task id'
	exit 1
}




$errorCode = $response.response.error.code
if($errorCode -gt 0) {
	$errorText = $xml.response.error.InnerText
	$errorText
	WriteError "Failed to login to ClickUp - error code: $errorCode - $errorText"
	exit 1
}


$json = ConvertFrom-JSON $response.Content 
$case = $caseNumber
$title2=$json.name
if($title2.Length -eq 0) {
	WriteError "Case number not found in ClickUp: case - ${caseNumber}; no action taken"
	exit 1
}

$titleLength = 30
$pat = '[^a-zA-Z0-9]'
$temp1 = ($title2 -replace $pat, ' ') -replace '\s+', ' '
$tempTitle2 = (Get-Culture).TextInfo.ToTitleCase($temp1.ToLower());
$tempTitle3 = $tempTitle2 -replace ' ', '' 
$tempTitle  = $tempTitle3 -replace '_', ''
if($tempTitle.length -gt $titleLength) { $tempTitle = $tempTitle.substring(0, $titleLength)  }
$title = $tempTitle
$caseAndVersion =  "c" + $case + "_" + $version.Replace(".", "").Replace("v", "") + "_$title";

$path = $basepath + $caseAndVersion;
$rssFile = $path + "\caseinfo.json" 



if(test-path $path)
{
	'Directory already exists; no action taken'
	exit 1
}



mkdir $path  > $null
$response.Content > $rssFile 
$host.ui.RawUI.WindowTitle = (Get-ScriptName) + ' - ' + $caseAndVersion;
# -----------------------------------------------------------------------------


$logFile = "$path/source.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
WriteStatus $logFile $path
# -----------------------------------------------------------------------------
# refresh source
#


$acquireSrcTime = [System.Diagnostics.Stopwatch]::StartNew()
$assetsPath = Get-AssetsDir 
$assetsVersionPath = $assetsPath + $version
if(test-path $assetsVersionPath) 
{
  WriteStatus $logFile 'refreshing source'
  & svn up $assetsVersionPath | out-file -append $logfile
}
else
{
  WriteStatus $logFile 'downloading source'
  & svn co $svnurl $assetsVersionPath | out-file -append $logfile
  if($LASTEXITCODE -ne 0)
  {
    WriteStatus $logFile "Error downloading source; see $logfile";
    remove-item $rssFile  
    $host.ui.RawUI.WindowTitle = $caseAndVersion;
    SetPowerShellTabLabel;
    exit 1
  }
}
$acquireSrcTime.Stop();
WriteStatusWithDuration $logfile "acquiring source"  $acquireSrcTime
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# getting source
#


$copySrcTime = [System.Diagnostics.Stopwatch]::StartNew()
WriteStatus $logFile 'copying source'
& robocopy $assetsVersionPath $path /mir /log+:$logfile /mt /xx  > $null

$copySrcTime.Stop();
WriteStatusWithDuration $logfile "copying source"  $copySrcTime
# -----------------------------------------------------------------------------
# update the files in the project 
#

$logFile = "$path/build.log"
write-host -NoNewline '' | out-file -encoding ascii  $logFile 
WriteStatus $logFile 'setting up project files'

Set-Location $path 
$wbinitPath = $PSScriptRoot
$wbinit = $wbinitPath + "\wbsln.ps1"
& $wbinit
# -----------------------------------------------------------------------------
# create template files for case
#


$casesDirectory = $path + "/scripts/cases"
if(-not (test-path $casesDirectory)) {
  mkdir $casesDirectory > $null
  & svn add $casesDirectory | out-file -append $logfile
}

$thisCaseDirectory = $path + "/scripts/cases/c" + $case
if(-not (test-path $thisCaseDirectory)) {
  mkdir $thisCaseDirectory > $null
  out-file -FilePath ($thisCaseDirectory + "/extracts1.txt") -Encoding ascii
  out-file -FilePath ($thisCaseDirectory + "/queries.sql")   -Encoding ascii
  & svn add $thisCaseDirectory | out-file -append $logfile
}
# -----------------------------------------------------------------------------


$buildSrcTime = [System.Diagnostics.Stopwatch]::StartNew()
WriteStatus $logFile 'building source'
$buildExe = Get-BuildExe(Get-Location)
& $buildExe -nologo -D:configBuildFilename=config.wb.build initial | out-file -append $logfile
if($LASTEXITCODE -ne 0) {
  WriteError "Error building; see $logfile";
  "The .\BuildAll.cmd command can be used to continue."
  SetPowerShellTabLabel;
  exit 1
}

$buildSrcTime.Stop();
WriteStatusWithDuration $logfile "building source"  $buildSrcTime
# -----------------------------------------------------------------------------


$resetTime = [System.Diagnostics.Stopwatch]::StartNew()
WriteStatus $logFile 'resetting database'
Set-Location database\Scripts
$user = Get-DbAdminUser 
$pass = Get-DbAdminPass 
.\Invoke-AquilanService.ps1 $user $pass base -nostart | out-file -append $logfile
if($LASTEXITCODE -ne 0) {
  WriteError "Error invoking service; see $logfile";
  "The .\Invoke-AquilanService.ps1 sa sa base -nostart   command can be used to continue."
  SetPowerShellTabLabel;
  exit 1
}
# -----------------------------------------------------------------------------


Set-Location $(Get-CaseWorkDirectory(Get-Location));
# -----------------------------------------------------------------------------


$resetTime.Stop();
WriteStatus $logfile "resetting database ts: $($resetTime.Elapsed.ToString())"
WriteStatus $logfile "------------------------------------------------------------------------"
WriteStatus $logfile "acquire source ts: $($acquireSrcTime.Elapsed.ToString())"
WriteStatus $logfile "copy source ts:    $($copySrcTime.Elapsed.ToString())"
WriteStatus $logfile "build source ts:   $($buildSrcTime.Elapsed.ToString())"
WriteStatus $logfile "reset database ts: $($resetTime.Elapsed.ToString())"
WriteStatus $logfile "total ts:          $($totalTime.Elapsed.ToString())"
WriteStatus $logfile "------------------------------------------------------------------------"
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


