# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------


. ($PSScriptRoot + "\wbcmn.ps1");
if(-not $basepathPrivate) { exit 1; }
Show-Help -summaryHelp  "Start the Visual Studio application with the PatriotManager solution."  `
          -detailHelp  "Usage:  $(Get-ScriptName) [sd|wd|i]
             sd - Use the ScriptDriver solution
             wd - Use the WatchdogMonitor solution
             i  - Use the Installer solution" 
TestValidDirectory;
SetPowerShellTabLabel;
# -----------------------------------------------------------------------------


$caseNumber = Get-CaseNumber(Get-Location);
$caseAndVersion = Get-CaseAndVersion(Get-Location);
$slnPath = Get-CaseTopDirectory(Get-Location);
# -----------------------------------------------------------------------------
if($args.Count -eq 1 -and $args[0] -eq 'sd') {
	$slnFile = $slnPath + "\Aquilan.ScriptDriver\Aquilan.ScriptDriver.sln"
}
elseif($args.Count -eq 1 -and $args[0] -eq 'wd') {
	$slnFile = $slnPath + "\BuildTools\dc\wd\Watchdog.sln"
}
elseif($args.Count -eq 1 -and $args[0] -eq 'i') {
	$slnFile = $slnPath + "\Installer.Model\Installer.Model.sln"
}
else {
	$userProj = @"
<?xml version="1.0" encoding="utf-8"?>
	<Project ToolsVersion="Current" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
	  <PropertyGroup>
		<LastActiveSolutionConfig>Debug|Any CPU</LastActiveSolutionConfig>
		<UseIISExpress>true</UseIISExpress>
		<Use64BitIISExpress />
		<IISExpressSSLPort />
		<IISExpressAnonymousAuthentication />
		<IISExpressWindowsAuthentication />
		<IISExpressUseClassicPipelineMode />
		<UseGlobalApplicationHostFile />
	  </PropertyGroup>
	  <ProjectExtensions>
		<VisualStudio>
		  <FlavorProperties GUID="{349c5851-65df-11da-9384-00065b846f21}">
			<WebProjectProperties>
			  <StartPageUrl>logoff.aspx</StartPageUrl>
			  <StartAction>SpecificPage</StartAction>
			  <AspNetDebugging>True</AspNetDebugging>
			  <SilverlightDebugging>False</SilverlightDebugging>
			  <NativeDebugging>False</NativeDebugging>
			  <SQLDebugging>False</SQLDebugging>
			  <ExternalProgram>
			  </ExternalProgram>
			  <StartExternalURL>
			  </StartExternalURL>
			  <StartCmdLineArguments>
			  </StartCmdLineArguments>
			  <StartWorkingDirectory>
			  </StartWorkingDirectory>
			  <EnableENC>True</EnableENC>
			  <AlwaysStartWebServerOnDebug>False</AlwaysStartWebServerOnDebug>
			  <UseIIS>True</UseIIS>
			  <AutoAssignPort>True</AutoAssignPort>
			  <DevelopmentServerPort>0</DevelopmentServerPort>
			  <DevelopmentServerVPath>/${caseAndVersion}</DevelopmentServerVPath>
			  <IISUrl>http://localhost:2${caseNumber}/${caseAndVersion}</IISUrl>
			  <NTLMAuthentication>False</NTLMAuthentication>
			  <UseCustomServer>False</UseCustomServer>
			  <CustomServerUrl>
			  </CustomServerUrl>
			</WebProjectProperties>
		  </FlavorProperties>
		</VisualStudio>
	  </ProjectExtensions>
	</Project>
"@;


	$webProjUserFile = $slnPath + "\PatriotManager\PatriotManager.csproj.user"
	if(-not (Test-Path($webProjUserFile))) {
		Set-Content -Path $webProjUserFile -Value $userProj
	}
	# -----------------------------------------------------------------------------


	$slnFile = $slnPath + "\Aquilan-" + $caseAndVersion + ".sln"
}

if(Test-Path $slnFile) {
	$vsPath = Get-VisualStudioPath;
	Start-Process $vsPath /nosplash, $slnFile   #-Verb RunAs; 
}
else {
	WriteError "no solution file found."
}
# -----------------------------------------------------------------------------

