# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
# -----------------------------------------------------------------------------


$pwd = Get-Location;
$dbServer = Get-DbServer;
$basepath = Get-SrcDir;
$caseAndVersion = Get-CaseAndVersion(Get-Location);
$path = $basepath + $caseAndVersion;
$dbName = $caseAndVersion;


# if ( (-not (Test-Path ($path + "/caseinfo.xml"))) -or  (-not (Test-Path ($path + "/caseinfo.json")))) {
if( -not (IsValidDirectory($path))) {
	WriteError "invalid workspace; caseinfo.xml or caseinfo.xml not found."
	exit 1
}


push-location -path $path 


# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# Aquilan-*.sln
#
#
# rename file to "Aquilan-$caseAndVersion.sln"
#


$oldfile =  (get-childitem  Aquilan-*.sln).Name
$solutionfile = "Aquilan-$caseAndVersion.sln"

if ($oldfile -and $oldfile -ne $solutionfile) {
	#svn mv $oldfile $solutionfile 
	if((Test-Path $oldfile) -and (-not (Test-Path $solutionfile))) {
 	   Move-Item $oldfile $solutionfile 
	}
}


# -----------------------------------------------------------------------------
# config.build
#
#
#   DatabaseServer
#   DatabaseName
#   SolutionFileName
#   MSBuild
#


Copy-Item ($path + "\config.build") ($path + "\config.wb.build")
$file = Get-Item ($path + "\config.wb.build")
[xml]$xml = Get-Content $file
$xml.SelectNodes('//property[@name="DatabaseName"]/@value')[0].'#text'     = $dbName 
$xml.SelectNodes('//property[@name="DatabaseServer"]/@value')[0].'#text'   = $dbServer
$xml.SelectNodes('//property[@name="SolutionFileName"]/@value')[0].'#text' = $solutionfile
$xml.SelectNodes('//property[@name="MSBuild"]/@value')[0].'#text'          = $msbuildPrivate

$xml.Save($file.FullName)


# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# Copy App.config.example to App.config
#


Set-AppConfig($path);
# -----------------------------------------------------------------------------
# need to execute the 
#      nant setup (to execute - build.set.config)
#


Push-Location $path 

$logFile = "$path/build.log"
$buildExe = Get-BuildExe(Get-Location)
& $buildExe -nologo -D:configBuildFilename=config.wb.build setup | out-file -append $logfile
if($LASTEXITCODE -ne 0)
{
  WriteError "error default.build - build.set.config";
  Pop-Location
  
  exit 1
}

Pop-Location
# -----------------------------------------------------------------------------
# PatriotManager/web.connectionString.config
#


$file = Get-Item ($path + "\PatriotManager\web.connectionStrings.config")
[xml]$xml = Get-Content $file
$xml.SelectNodes('//connectionStrings/add[@name="apm"]/@connectionString')[0].'#text' = "Persist Security Info=False;server=$dbServer;database=$dbName;user id=apm;password=Qo9ajs"
$xml.Save($file.FullName)
# -----------------------------------------------------------------------------


pop-location 

