

Workbench Development Scripts
    The Workbench Development Scripts are PowerShell scripts used to manage / develop the Patriot Manager code base.

    The scripts provide commands for building the code, creating/upgrading the database, starting development 
    applications, copying extract files, opening log files. 

    The concept is to checkout (no lock) source code by Issue Tracker case number and version. Each time a new case 
    is created and changes to source code are required or a workbench context is needed for investigation, then source 
    code is checked out and work is performed in the area. Giving isolation to the work. When backporting is required 
    then another workbench context is created for the port target.

    The scripts work by checking out the source code referencing a ClickUp case number and source code branch 
    label. The script creates a directory with name "c{caseNumber}_{branchVersion}_{caseTitle}" in the wb 
    directory. This gives the rest of the scripts a context when operating in the subdirectories. 

    IISExpress is used in place of IIS. Benefits include no longer running Visual Studio in Administrator mode 
    and IISExpress has a console window to see log information. 


Motivation
    Why create these scripts and workflow?

    I found that in late 2019 that the number of investigations requested by customers and project managers were 
    coming faster and faster. And an investigation would span multiple weeks because of requesting queries to 
    the customer and needing to wait for results. Or tasks would start and then need to pause because of priorities. 

    I wanted a workflow where a task would be a single task and not interrupted or overwritten by another task.

    I also wanted to execute the existing scripts from any directory in a workbench context. Such as the 
    Invoke-AquilanService.ps1 = dbload, UpgradeDatabase.cmd = dbup, Start-AquilanService.ps1 = goaqs 
    scripts. I wanted to start programs in my current context such start Visual Studio or SQL Server Managerment 
    Studio and not use file pickers to get my source files.

    I wanted case artifacts checked in as well. Files such as queries and extract files related to the case
    worked on. Or, one off scripts/queries sent to a customer but not every customer. Files that we want to keep
    but we do not want in the ISO.

    Lastly, I believe this command line like workflow moves towards dotnet core style development. 


Workflow
    This demonstrates the start of a normal workflow.  
        - Create a case in ClickUp,
        - Checkout the source with version and case number,
            PS$  wbco -v v5.0.0 -c 2586
                This command checks out the soure code and builds APM. The first time takes longer than subsequent 
                checkouts because the entire source tree branch is downloaded and cached. Next, workbench context 
                creation will take less time if on the same branch because the source code cached is used. 
        - Reset the database 
            PS$  dbload base
                This command runs the Invoke-AquilanService.ps1 
        - Load Cycle 2 data
            PS$  cx2 
        - Start the browser with APM
            PS$  goweb
        - Start Visual Studio
            PS$  govs

        

Case Artifacts
    Case Artifacts include testing queries, investigation queries, extract record files, and anything else used
    to recreate the issue and show the issue is fixed. 

    The artifacts are stored in the directory ~/scripts/cases/c{caseNumber}. The checkout script (wbco) creates 
    the directory and populates it with files extracts1.txt and queries.sql.

    These artifacts should be checked in for future reference.

    Additionally, one off scripts / queries sent to customers should be checked in here as well.


Visual Studio Debugging
    The PatriotManager web project uses the PatriotManager.csproj.user to store the IISExpress configuration
    for debugging. This config file is created at checkout time, wbco.

    The IISExpress config file is stored in
    D:\wb\{caseAndVersion}\.vs\Aquilan-{caseAndVersion}\config\applicationhost.config
    This file is created by Visual Studio at startup. This file can be deleted and Visual Studio will recrate it.

    Additionally, Visual Studio can be used to attach to IISExpress to debug a running APM. 


Scripts
    The scripts are divided into 6 sets: 
        - bld - Build scripts
        - cd  - Navigation scripts (change directory short cuts)
        - cx  - Loader scripts to copy extract files to the loader directories 
        - db  - Database scripts to manage creating and updating the database
        - go  - Program startup scripts 
        - ol  - View log files
        - wb  - Workbench scripts to manage source code control and Workbench contexts

    Help
        -wbhelp   - shows all the commands
                  - each command has a -h command line argument that shows more details if available

    Workbench Scripts
        - wbco    - check out the source code and build the solution
        - wbci    - check in the source code
                  - the files are not checked in, rather the command is echoed to the display and can 
                    cut and paste removing files not wanted from check in.
        - wbst    - status of the source code
        - wbup    - update the source code from the repository
        - wbcp    - copy file from current Workbench context to another
        - wblc    - list files already committed for this case
        - wbrm    - remove the current context including dropping the database
        - wbsln   - update the solution / connection string settings; used by the wbco scripts
        - wbcmn   - internal and used by all scripts
        - wbrest  - upgrade the Workbench scripts from source control
        - wbconf  - config file script; update this with program paths and root path
        - wbcc    - check / verify the configuration file
        - wbver   - show the Workbench script version

    Build Scripts
        - bldall  - build all
        - bldda   - generate the data access code
        - bldexe  - build debug executables
        - bldaqs  - build the Service executable
        - bldweb  - build the web executable
        - bldts   - build the TypeScript files
        - bldcle  - clean the executables

    Program Scripts
        - govs    - start Visual Studio with current context
        - gossms  - start SQL Server Management Studio with main artifacts sql file (startup is slow)
        - goaqs   - start the Aquilan Service in the current context in the background
        - aqs     - start the Aquilan Service in the foreground
        - goweb   - start IISExpress and the browser in the current context
                  - creates file ~/wb/iisexpress_applicationhost.config
                  - this file contains the configuration / metabase for iis express
                  - this file can be remove periodically and goweb will recreate it
        - gocase  - open the ClickUp case in the browser
        - gobro   - start the TortoiseSVN Browser
        - goci    - start the TortoiseSVN checkin dialog
        - godiff  - start the TortoiseSVN diff dialog.
        - golog   - start the TortoiseSVN log dialog.
        - killaqs - kill the Aquilan Service process
        - killweb - kill the IISExpress process process
        - killall - kill all programs associated with the Workbench context
                  - (Visual Studio, SSMS, Aquilan Service, and IIS Express)

    Database Scripts
        - dbload  - create the database and load the install/setup files.
        - dbdrop  - drop the context database.
        - dbmiss  - show (option to drop) databases with missing Workbench context.
        - dbst    - execute the database update stored procedures command.
        - dbup    - execute the database upgrade command.
        - dblas   - load the alert scripts into the database.
        - dblcs   - load the chart scripts into the database.
        - dblts   - load the transformer scripts into the database.

    Loader Extract Scripts
        - cxd     - delete the currently loaded extract records and alerts from the database
        - cx1     - copy the specified extract file to the 101source loader directory 
        - cxb     - copy the specified extract file to the bulk loader directory
        - cx2     - copy Cycle-2.pme extract file to the 101source loader directory
        - cxreg   - copy the specified regression test to the loader directory 
        - cxt     - trigger an Aquilan Service action

    Navigation Scripts
        - cdwb    - change the directory to the top of the source tree
        - cddb    - change the directory to the context ~/database/Scripts directory
        - cdcase  - change the directory to the context ~/scripts/cases/cNumber directory
        - cdscr   - change the directory to the context ~/scripts directory
        - cdtop   - change the directory to the context top level directory
    
    View Logs
        - oldb   - open database log
        - olsrc  - open source code checkout log
        - olbld  - open build log
        - ollex  - open loader extract error log
        - olweb  - open web server log

    Windows Useful Commands
        - start .  - start the Windows Explorer in the current directory
        - wt       - start a new Windows Terminal window
        - ssms     - start SQL Server Management Studio
        - profiler - start SQL Server Profiler

Subversion Commands
    Subversion commands from the command line to use include among others:
        - svn up   - update the checked out source with the repository
        - svn diff - compare a file with the version in the repository
        - svn mv   - rename file



Installation
    These are the steps to setup Workbench Development Scripts. 
    The examples use the path D:\wb; this path can be tailored to your needs.

    Install Windows Terminal
        The Windows Terminal is in Preview and can be found in the Microsoft Store

    Install Powershell Core - https://aka.ms/pscore6
        Scripts require PowerShell version 7

    Install Subversion command line tools
        Verify the Subversion command line programs are installed and in the PowerShell path.
            PS$  svn --version 
        
        To install, select command line tools 
            - TortoiseSVN - https://tortoisesvn.net/downloads.html
    
    Install Workbench scripts
        Execute this command to get the scripts
            PS$   svn export --force https://bld00.aquilan.atx/svn/aquilan/branches/v5.0.0/BuildTools/wb D:/wb/bin

    Setup the Workbench config file
        Set the correct paths in the config file, wbconf.ps1. (file D:\wb\bin\wbconf.ps1)
            This file does not exist by default, but needs to be created. Use the example file.
            Rename the file wbconf.ps1.example to wbconf.ps1
            Edit the file wbconf.ps1 making the required personal changes.
            Populate the $itPass variable with the ClickUp auth token
                The ClickUp auth token is copied from the ClickUp user settings -> Apps -> API Token
            The $itUser variable is not used 
            Potential items to update include: DB admin user, DB admin password, and Workbench path.

    Add Workbench path to PowerShell 
        Add D:\wb\bin to the path in the PowerShell profile
            Example:   $env:Path += ";D:\wb\bin"  
        
        The PowerShell profile can be editted by using notepad in PowerShell
            PS$   notepad $profile

    Check configuration
        Check wbconf.ps1 setting using this command.
            PS$  wbcc


Issues:
    - Files are updated with connection strings such App.config and these files can be checked into source control
        but the next Workbench context created will overwrite those files and can be checked in as well. This is 
        a lot of unneeded checked in changes to those files.
        One solution is to rename those files to App.config.example and have the Workbench / build scripts rename
        them to the correct name, back to App.config
    - May want to put the sqlcmd into the wbcmn.ps1 file and not rely upon it being in the path.
    

    - Windows 11 - Event Log security issue - The fix is to go to the registry key 
      HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog and make sure the user the scripts are running 
      as is added and has “Full Control”. Also, not all of the child keys under it inherit the parent permissions, 
      so some of them may have to have their permissions updated manually as well.


