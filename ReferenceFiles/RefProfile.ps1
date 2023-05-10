#####***************************************************************#####
##### Administrative - check if AD Module is installed and set location C:\####
              <#
                    if (Get-Module -ListAvailable -Name ActiveDirectory) {
                        Write-Host "Module exists" -ForegroundColor Green

                    } else {
                        #Write-Host "Module does not exist"
                        Import-Module ActiveDirectory
                    }
              #>  
Set-Location C:\
Function Vlad {Start-Process powershell.exe -verb runAs}
Set-Alias -Name PowerUp -Value Vlad
#
function Get-TimeStamp {
     #MilitaryTime 
     #return "`n [{0:MM/dd/yy} {0:HH:mm:ss}] `n" -f (Get-Date)

     #With AM/PM
     return "[{0:MM/dd/yy} {0:hh:mm:ss tt}]" -f (Get-Date)
}



Function BustIn-Backdoor {
    <#
    .SYNOPSIS
    Remote into a PC with your admin creds

    .DESCRIPTION
    This will allow you to open a remote PS Session on a device with Admin Creds

    .PARAMETER attachments
     Enter the Computer number of the device you want to run remote scripts on. 

    .EXAMPLE
     PS C:\> BustIn-Backdoor C1011708

            First Initial - Last Name?: servicedesk

            Don't forget to close the window or hit exit when done
    #>    

    [CmdletBinding()]
    Param(
           
           [Parameter(Mandatory=$True)]   
            $Computer
        )
          

    #Define First Initial Last Name Acct
        $usershit = Read-Host "`nEnter Servicedesk or First Initial/Last Name Acct?"
        $Domain = $env:USERDOMAIN
        $WithDomain = get-credential -Message "?" -User $DOMAIN\$usershit 

    #Open Remote Session

        Write-Host "Don't forget to close the window or hit exit when done" -ForegroundColor Red
        Enter-PSSession -ComputerName $computer -Credential $WithDomain

}

Function Menu-CassIT(){
    Clear-Host
    Write-Host "#=========================================================================================#"
    Write-Host "|                                                                                         |"
    Write-Host "|                  " -NoNewLine; Write-Host -foregroundcolor Green "Cass County IT Powershell Module - Est. 28.10.2018" -NoNewLine; write-host "                     |"
    Write-Host "|                  --------------------------------------------------                     |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor red "Commands denoted with an asterisk * are dangerous, pay attn to what it tells you." -NoNewline; write-host "   |"
    Write-Host "|                                                                                         |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Cyan "User Accounts:" -NoNewline; write-host "                                                                      |"
    Write-Host "|                                                                                         |"
    Write-Host "|     " -NoNewLine; Write-Host -foregroundcolor Green "Enable-BSI           Enables BSI AD Accounts" -NoNewLine; write-host "                                        |"
    Write-Host "|     " -NoNewLine; Write-Host -foregroundcolor Green "Unlock-User          Unlock user account by username" -NoNewLine; write-host "                                |"
    Write-Host "|     " -NoNewLine; Write-Host -foregroundcolor Green "WhoIs-LockedOut      Displays all currently locked user accounts" -NoNewLine; write-host "                    |"
    Write-Host "|                                                                                         |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Cyan "Informational:                                                                      |"
    Write-Host "|                                                                                         |"
    Write-Host "|     Contact-Card         Displays user information from ADUC                            |"
    Write-Host "|     Ferret-Out           Displays computer information from ADUC                        |"
    Write-Host "|     Get-ADComputers      Creates a .csv of all computers in ADUC                        |"
    Write-Host "|     Get-CollectionCSV    Creates a .csv of specified collection from SCCM               |"
    Write-Host "|     Get-Model            Returns computer model of specified computer                   |"
    Write-Host "|     Get-WinBuild         Returns Windows build of specified computer                    |"
    Write-Host "|     Netmotion-IP         Displays Netmotion IP list from NetmotionOfTheOcean.txt        |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Magenta "OnCall-NinjaMenu     Displays secret menu for commands useful for OnCall" -NoNewLine; write-host "            |"
    Write-Host "|     Phone-Lookup         Search user by phone #                                         |"
    Write-Host "|     Printer-List         Displays a list of all printers in CCG                         |"
    Write-Host "|     Reboot-Reason        Finds last 10 reboot reasons for a device                      |"
    Write-Host "|                                                                                         |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Cyan "File Management:" -NoNewLine; write-host "                                                                    |"
    Write-Host "|                                                                                         |"
    Write-Host "|     Copyto-Sandbox       Copy files from local PC to Sandbox$\FileBackup                |"
    Write-Host "|     Copyfrom-Sandbox     Copy files from Sandbox$\FileBackup to local PC                |"
    Write-Host "|     Lazy-OneDrive        Copy files from local PC + home$ drive to OneDrive-Cass Cty    |"
    Write-Host "|                                                                                         |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Cyan "Administration:" -NoNewLine; write-host "                                                                     |"
    Write-Host "|                                                                                         |"
    Write-Host "|     Add-ExacqVisionSOC   Adds user to the Cass-SOC-FS-Visitation AD Group               |"
    Write-Host "|     BustIn-Backdoor      Enter Powershell session to specified PC with cred prompt      |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Yellow "Delete-Profile*      Deletes specified user profile from remote computer" -NoNewLine; write-host "            |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Yellow "PCPurge*             Removes computer from ADUC + SCCM" -NoNewLine; write-host "                              |"
    Write-Host "|     RemoteAssist         Remote into computer with specified computer #                 |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Yellow "Remove-AllProfiles*  Deletes ALL user profiles from specified computer" -NoNewLine; write-host "              |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Yellow "Remove-Members*      Removes all members from SCCM collection" -NoNewLine; write-host "                       |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Yellow "Rename-Stuff*        Rename or change description of specified computer" -NoNewLine; write-host "             |"
    Write-Host "|     " -nonewline; write-host -foregroundcolor Yellow "Remove-Software*     Uninstall software on remote machine" -NoNewLine; write-host "                           |"
    Write-Host "|                                                                                         |"
    Write-Host "#=========================================================================================#"
}

New-Alias -Name Menu Menu-CassIT

Menu-CassIT 
    
    Function MenuAdvanced-CassIT(){
    Clear-Host
    Write-Host "#===========================================================================================#"
    Write-Host "/                                                                                           /"
    Write-Host "/      " -NoNewline; Write-Host -ForegroundColor Red "Levon Gets His Way Again and Now There is a Hidden Menu - 28.10.2018" -NoNewline; Write-Host -ForegroundColor White "                 /"
    Write-Host "/      " -NoNewline; Write-Host -ForegroundColor Red "----------------------------------------------" -NoNewline; Write-Host -ForegroundColor White "                                       /"
    Write-Host "/                                                                                           /"
    Write-Host "/      " -NoNewline; Write-Host -ForegroundColor Blue -BackgroundColor Gray "Current Commands:" -NoNewline; Write-Host -ForegroundColor White "                                                                    /"
    Write-Host "/                                                                                           /"
    Write-Host "/         Email-BlastCLR              Add Email notice to Cassie                            /"    
    Write-Host "/         Email-Blast                 Add Email notice for anyone                           /"    
    Write-Host "/         Get-TimeStamp               Add a TimeStamp to Whatever                           /"    
    Write-Host "/         Deradicalize-DNS            Change Static DNS information on specified device     /"
    Write-Host "/         Server-Deets                Will query all servers in specific OU & find hardware /"
    Write-Host "/         Software-Insanity           Will query all servers in specific OU & find software /"
    Write-Host "/         Lockout-Suicide             Polls all the locked accounts                         /"
    Write-Host "/         LockoutLDAP-Suicide         Polls all the locked accounts and autounlocks LDAP    /"
    Write-Host "/         Printer-SuicideWatch        Launch Print Spooler watch on 91v & restart service   /"    
    Write-Host "/         Toasty-Smalls               Figure it out                                         /"
    Write-Host "/                                                                                           /"
    Write-Host "/      " -NoNewline; Write-Host -ForegroundColor Blue -BackgroundColor Gray "PS Access Modules:" -NoNewline; Write-Host -ForegroundColor White "                                                                   /"
    Write-Host "/          SharePoint-Module          Access SharePoint Online Commands                     /" 
    Write-Host "/          Exchange-Module            Access Exchange Online                                /"
    Write-Host "/          MSOL-Module                Access MSOL                                           /"
    Write-Host "/          Lync-Module                Access Lync Online Connector                          /"
    Write-Host "/          Teams-Module               Access Teams Beta Module                              /"
    Write-Host "/          ComplianceCenter-Module    Access Compliance and Security Center                 /"     
    Write-Host "/      " -NoNewline; Write-Host -ForegroundColor Green "  **Initialize-All365**" -NoNewline; Write-Host -ForegroundColor Green "         Will Run all the modules listed above"-NoNewline; Write-Host -ForegroundColor White "                /"
    Write-Host "/         NoReply-Maint               Will give stats and do deletes to the no-reply mailbox/"
    Write-Host "/                                                                                           /"    
    Write-Host "/      " -NoNewline; Write-Host -ForegroundColor Blue -BackgroundColor Gray "SCCM Functions:  " -NoNewline; Write-Host -ForegroundColor White "                                                                    /"
    Write-Host "/      SCCM-Module                 Access SCCM PS and SC5 Site                              /"    
    Write-Host "/      FindCollect-DestroyDirect   Delete direct relationships based on search and selection/"    
    Write-Host "/                                                                                           /"
    #Write-Host "/     *Under Construction -                                                                /"    
    #Write-Host "/      *Under Construction - Malware Reaction/Prevention                                    /"    
    Write-Host "/         Start-BigBrother             Start Transcript in CassIT folder                    /"
    Write-Host "/         Stop-BigBrother              Stop all Transcripts running                         /"
    Write-Host "/      " -NoNewline; Write-Host -ForegroundColor Red "Hint: type get-help <command> for help!"  -NoNewline; Write-Host -ForegroundColor White "                                              /"
    Write-Host "/      " -NoNewline; Write-Host -ForegroundColor Red "Hint: type get-help <command> -examples for help!"  -NoNewline; Write-Host -ForegroundColor White "                                    /"
    Write-Host "/                                                                                           /"
    Write-Host "/      Link to Wiki:  " -NoNewline; Write-Host -ForegroundColor Yellow "http://code.casscountynd.gov/Crott/psmoduleprofiles/wikis/home"  -NoNewline; Write-Host -ForegroundColor White "        /"
    Write-Host "/                                                                                           /"
    Write-Host "#===========================================================================================#"
    Write-Host ""
}

#MenuAdvanced-CassIT
#####***************************************************************#####
function Start-BigBrother()
    {
    [CmdletBinding()]
        Param (
            [Parameter(Mandatory=$True)]        
              [string]$Name,
            [Parameter(Mandatory=$False)]        
              [string]$Descript
             )

        ##Where you want to save the logs to
        $logFolder = "\\c9svr119v\sandbox`$\Logs\"
        #$logFolder = "C:\CassIT\Logs\"

        #Function Name/Descipt of function 
        #$funcdescript = "-$descript-"
        
        #change computer for whatever you may have for mandatory parameters or other distinguishable feature
        $NamedTranscript = "$Name" + $funcdescript
          
       #Use for new log with date in name 
        $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
       # $ILogName = $NamedTranscript + "_" + $IDate + ".log"
       # $ILog = $LogFolder + $ILogName

       ##Append current log
        $ILogName = $NamedTranscript + ".log"
        $ILog = $LogFolder + $ILogName
     
            Start-Transcript -Path "$ILog" -NoClobber -Append
     
    }
$NameofScript = $env:USERNAME
Start-BigBrother -Name $NameofScript



function Start-BigBrotherAdvanced() {
    # .EXTERNALHELP C:\Users\rottc\OneDrive - Cass County\Desktop\GIT Stuff\IT Server Profiles-Modules\HelpDocs\BigBrotherTranscript.xml

    [CmdletBinding()]
        Param (
            [Parameter(Mandatory=$True)]        
            [string]$Name,
            [Parameter(Mandatory=$False)]        
            [switch]$CassIT,
            [string]$subfolder,
            [String]$ClearLog207,
            [switch]$dated,
            [string]$ClearLogIT
            )
    ##Where you want to save the logs to --- Default save is to c9svr207v\Serverlogs$
    
    ##Uses a Switch to determine where the log should go either 207 logs folder or CassIT locally
        if($CassIT.IsPresent){
            $logFolder = "C:\CassIT\Logs\"
        }
        Else {
            $logFolder = "\\C9SVR207V\ServerLogs`$\"
        }

    ##Do you need to clear the contents of a log file 
        if($ClearLog207){
            #Write-Host "Clear Log on 207?"  $ClearLog207
            $Clear207 = Clear-Content "\\c9svr207v\ServerLogs$\$ClearLog207.log"
        }
        if($ClearLogIT){
            Write-Host $ClearLogIT
            $ClearIT = Clear-Content "C:\CassIT\$ClearLogIT.log"
        }

    ##Use for new log with date in name            
        if($dated.IsPresent){
            $NamedTranscript = "$Name" 
            $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
            $ILogName = $NamedTranscript + "_" + $IDate + ".log"

            if ($subfolder) {
                $sub = "$subfolder"
                $sub2 = $sub + "\"
                $ILog = $LogFolder + $sub2 + $ILogName
                
            } 
            Else {
                $ILogName = $NamedTranscript + "_" + $IDate + ".log"
                $ILog = $LogFolder + $ILogName
            }  
            
            Start-Transcript -Path "$ILog" -NoClobber -Append
            Return
        }

    ##Otherwise just let her buck and use the name provided
        Else{                
            $NamedTranscript = "$Name" 
            $ILogName = $NamedTranscript + ".log"

            if ($subfolder) {
                $sub = "$subfolder"
                $sub2 = $sub + "\"
                $ILog = $LogFolder + $sub2 + $ILogName
            }   
            Else {
            $ILog = $LogFolder + $ILogName
            }   
        }
    
    Start-Transcript -Path "$ILog" -NoClobber -Append
    }

#####***************************************************************#####
##Start
####################Send Anyone Email##########################################################################

function Email-blast () {
    <#
    .SYNOPSIS
    Send email to specified individuals. 

    .DESCRIPTION
    I have tried to think of all the variations in how an email is sent - from Attachments to CC/BCC. 

    .PARAMETER EnterSubject
    Mandatory - enter the information you want included in the subject line

    .PARAMETER EnterBody
    Mandatory - enter the information you want to include in the body of your email. By default a time/date stamp and the user who generated the email are included. 

    .PARAMETER whatcc
    Specify a individual you wish to include in CC

    .PARAMETER whatbcc
    Specify a individual you wish to include in BCC

    .PARAMETER AddLevon
    Add this and it will include Levon in CC Field 

    .PARAMETER AddMatt
    Add this and it will include Matt in CC Field 

    .PARAMETER AddBrady
    Add this and it will include Brady in CC Field 

    .PARAMETER AddBoth
    Add this and it will include Levon and Matt in CC Field 

    .PARAMETER AddRyan
    Add this and it will include Ryan in CC Field 

    .PARAMETER AddCassie
    Add this and it will include Cassie in CC Field 

    .PARAMETER CRBlind
    Add this and it will include Cassie in BCC Field 

    .PARAMETER AllBlind
    Add this and it will include Matt, Levon and Cassie in BCC Field

    .PARAMETER LKBlind
    Add this and it will include Levon in BCC Field 

    .PARAMETER MSBlind
    Add this and it will include Matt in BCC Field 

    .PARAMETER attachments
    Add the location of the attachment to include in email

    .EXAMPLE
    Email-Blast -EnterSubject "No CC/BCC/Attach" -EnterBody "#1"

    .EXAMPLE
    Email-Blast -EnterSubject "No BCC/Attach -CC Manual" -EnterBody "#2" -whatcc "Rottc@casscountynd.gov"

    .EXAMPLE
    Email-Blast -EnterSubject "No CC/Attach -BCC Manual" -EnterBody "#3" -whatbcc "Rottc@casscountynd.gov"

    .EXAMPLE
    Email-Blast -EnterSubject "No BCC or Attach Added -AddBoth -CC Manual" -EnterBody "#4" -whatcc "Rottc@casscountynd.gov" -AddBoth

    .EXAMPLE
    Email-Blast -EnterSubject "No CC, BCC - Attach Added -CC Manual" -EnterBody "#5" -Attachments "C:\CassIT\ClientHealth.log"  

    .EXAMPLE
    Email-Blast -EnterSubject "No BCC - Attach Added -CC Manual" -EnterBody "#6" -Attachments "C:\CassIT\Computer.log","C:\CassIT\ClientHealth.log" -bcc "Rottc@casscountynd.gov" -AddMatt

    #>

    [CmdletBinding()]
    Param(
           [Parameter(Mandatory=$True)]        
            [alias("Subject")]
            $EnterSubject,
            [Parameter(Mandatory=$True)]   
            [alias("Body")]
            $EnterBody,
            [Parameter(Mandatory=$True)]
            [alias("To")]
            [string]$AliasOnly,

            [alias("cc")]
            $whatcc,
            [alias("bcc")]
            $whatbcc,
    
            [switch]$AddLevon,
            [switch]$AddMatt,
            [switch]$AddBrady,
            [switch]$AddAll,
            [switch]$AddCassie,
            [switch]$AddRyan,
            [switch]$CRBlind,
            [switch]$AllBlind,
            [switch]$LKBlind,
            [switch]$MSBlind,
            [switch]$AddJaden,
            [switch]$personalcellphone,
            [switch]$workcell,
            [switch]$Levoncell,
            [switch]$Mattcell,
            [switch]$html,
            
            [alias("Attach")]
            $attachments
    )
            
    #These never change - variables for email messages
          $SendTO = $AliasOnly + "@casscountynd.gov"
          $smtpServer = "smtp"
          $from = "no-reply@casscountynd.gov"
          $MainBody = "`n$EnterBody`n"  + "`n$(Get-TimeStamp)"+"`n--v--Email sent by $env:USERNAME`n--^--" + "Sent From Device: $Env:COMPUTERNAME`n"

      #Reference for Time later on the script
        function Get-TimeStamp {
        return "[{0:MM/dd/yy} {0:hh:mm:ss tt}]" -f (Get-Date)
        }           
#Define Preset individuals in parameter switches to include in CC 
    $cc_people = @()
    $bcc_people = @()
    
            If ($AddMatt){
                $ccMatt = "stewartm@casscountynd.gov"
                $cc_people += $ccMatt
            }
            If ($AddLevon){
                $Levon = "kohoutekl@casscountynd.gov"
                $cc_people += $Levon
            }
            If ($AddAll){
                $ccBoth = "kohoutekl@casscountynd.gov"
                $ccBothMS = "stewartm@casscountynd.gov"
                $ccCLR = "rottc@casscountynd.gov"
                $cc_people += $ccBoth
                $cc_people += $ccBothMS
                $cc_people += $ccCLR
            }
            If ($AddBrady){
                $Brady = "brudvikb@casscountynd.gov"
                $cc_people += $Brady
            }
            If ($cc){
                $cc_people += $cc
            }
            if ($whatcc) {
                $cc_people += $whatcc
            }
            if ($whatbcc){
                $bcc_people += $whatbcc
            }
            if ($Personalcellphone){
                $clrpersonalcell = "7012692264@vtext.com"
                $cc_people += $clrpersonalcell
            }
            if ($workcell){
                $clrworkcell = "7015268193@vzwpix.com"
                $cc_people += $clrworkcell
            }
            if ($Mattcell){
                $mattworkcell = "7018665742@vzwpix.com"
                $cc_people += $mattworkcell
            }
            if ($Levoncell){
                $levonworkcell = "7016302827@vzwpix.com"
                $cc_people += $levonworkcell 
            }
            If ($bcc){
                $bcc_people += $bcc
            }
            If ($AddJaden){
                $Jaden = "MayJ@casscountynd.gov"
                $cc_people += $Jaden
            }
            If ($AddRyan){
                $Ryan = "diedrichr@casscountynd.gov"
                $cc_people += $Ryan
            }
            If ($AddCassie){
                $Cassie = "rottc@casscountynd.gov"
                $cc_people += $Cassie
            }
            If ($CRBlind){
                $BCCCassie = "Rottc@casscountynd.gov"
                $bcc_people += $BCCCassie
            }
            If ($AllBlind){
                $bcc1 = "rottc@casscountynd.gov"
                $bcc2 = "kohoutekl@casscountynd.gov"
                $bcc3 = "stewartm@casscountynd.gov"
                $bcc_people += $bcc1
                $bcc_people += $bcc2
                $bcc_people += $bcc3
            }
            If ($MSBlind){
                $bccMatt = "stewartm@casscountynd.gov"
                $bcc_people += $bccMatt
            }
            If ($LKBlind){
                $bccLevon = "kohoutekl@casscountynd.gov"
                $bcc_people += $bccLevon
            }
            
    #$cc_people 
    #$bcc_people 
    
############ Evaluate for HTML  ####################
if ($html.IsPresent ){
            #Subject with appropriate line returns for html msgs
            $MainBody = "<br>$EnterBody<br>"  + "<br>$(Get-TimeStamp)"+"<br>Email sent by $env:USERNAME<br>" + "Sent From Device: $Env:COMPUTERNAME<br>"

    ############ Are there any attachments ####################

    if ($attachments -ne $null){

        ##Check if CC is listed##
            If ($cc_people.count -ne 0) {

                ##### Check for BCC in addition to CC #####
                If ($bcc_people.count -ne 0) {
                    Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Bcc $bcc_people -Attachments $attachments -BodyAsHtml
                    Write-Host "Sent Email to $SendTO  with CC $cc_people and BCC $bcc_people" -ForegroundColor Green
                    Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                    return
                }

                ##### No BCC listed just send with CC ##### 
                Else {
                Send-MailMessage -To $SendTO  -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Attachments $attachments -BodyAsHtml
                Write-Host "Sent email to $SendTO  and CC $cc_people" -ForegroundColor Green
                Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                return
                }
            }

        ##Needs to check if BCC exists when there isn't a CC
            If ($bcc_people -ne $null) {
                    Send-MailMessage -To $SendTO  -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BCC $bcc_people -Attachments $attachments -BodyAsHtml
                    Write-Host "Sent Email to $SendTO  with BCC $bcc_people" -ForegroundColor Magenta
                    Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                    return
                }  
    
    ##Didn't find a CC or BCC - sending with Attachments only
        Else {
            Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -Attachments $attachments -BodyAsHtml
                Write-Host "Sent Email to $SendTO " -ForegroundColor Green
                Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                return
        }

    }

    ############ No Attachments Found Evaluating CC & BCC ####################
    ##Check if there is a CC added
        If ($cc_people.count -ne 0) {

            ##### Check for BCC in addition to CC #####
                if ($bcc_people.count -ne 0) {
                    Send-MailMessage -To $SendTO  -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Bcc $bcc_people -BodyAsHtml
                    Write-Host "Sent Email to $SendTO with CC $cc_people and BCC $bcc_people" -ForegroundColor Green
                    return
                }

                Else {
                Send-MailMessage -To $SendTO  -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -BodyAsHtml
                Write-Host "Sent email to $SendTO  and CC $cc_people" -ForegroundColor Green
                return
                }
        }

    ##Needs to check if BCC exists when there isn't a CC
        If ($bcc_people.count -ne 0) {
            Send-MailMessage -To $SendTO  -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BCC $bcc_people -BodyAsHtml
            Write-Host "Sent Email to $SendTO  with BCC $bcc_people no one listed as CC" -ForegroundColor Green
            return
        }  



    ############ No Attachments and No CC or BCC#################### 
    Send-MailMessage -To $SendTO  -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BodyAsHtml
    Write-Host "`n If you don't seen any errors the email has been sent to $SendTo" -ForegroundColor Magenta
    return
}



############ End of HTML ####################



############ Are there any attachments ####################
        
if ($attachments -ne $null){
            ##Check if CC is listed##
                If ($cc_people.count -ne 0) {
        
                     ##### Check for BCC in addition to CC #####
                    If ($bcc_people.count -ne 0) {
                        Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Bcc $bcc_people -Attachments $attachments
                        Write-Host "Sent Email to $SendTO with CC $cc_people and BCC $bcc_people" -ForegroundColor Green
                        Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                        return
                    }

                    ##### No BCC listed just send with CC ##### 
                    Else {
                      Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Attachments $attachments
                      Write-Host "Sent email to $SendTO and CC $cc_people" -ForegroundColor Green
                      Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                      return
                    }
                  }
    
            ##Needs to check if BCC exists when there isn't a CC
               If ($bcc_people -ne $null) {
                        Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BCC $bcc_people -Attachments $attachments
                        Write-Host "Sent Email to $SendTO with BCC $bcc_people" -ForegroundColor Magenta
                        Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                        return
                    }  
         
           ##Didn't find a CC or BCC - sending with Attachments only
            Else {
                Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -Attachments $attachments
                    Write-Host "Sent Email to $SendTO" -ForegroundColor Green
                    Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                    return
            }
  
    }


############ No Attachments Found Evaluating CC & BCC ####################

    ##Check if there is a CC added
            If ($cc_people.count -ne 0) {
        
                ##### Check for BCC in addition to CC #####
                    if ($bcc_people.count -ne 0) {
                        Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Bcc $bcc_people
                        Write-Host "Sent Email to $SendTO with CC $cc_people and BCC $bcc_people" -ForegroundColor Green
                        return
                    }

                    Else {
                      Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people
                      Write-Host "Sent email to $SendTO and CC $cc_people" -ForegroundColor Green
                      return
                    }
            }
    
    ##Needs to check if BCC exists when there isn't a CC
            If ($bcc_people.count -ne 0) {
                Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BCC $bcc_people
                Write-Host "Sent Email to $SendTO with BCC $bcc_people no one listed as CC" -ForegroundColor Green
                return
            }  



############ No Attachments and No CC or BCC #################### 
Send-MailMessage -To $SendTO -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer 
Write-Host "`n If you don't seen any errors the email has been sent to $SendTO" -ForegroundColor Magenta

}

####################Send Anyone Emai End Functionl##########################################################################


##Start
####################Send CLR and Anyone Email##########################################################################

function Email-BlastCLR() {

    <#
    .SYNOPSIS
    Send email to Cassie and other specified individuals. 

    .DESCRIPTION
    I have tried to think of all the variations in how an email is sent - from Attachments to CC/BCC. 

    .PARAMETER EnterSubject
    Mandatory - enter the information you want included in the subject line

    .PARAMETER EnterBody
    Mandatory - enter the information you want to include in the body of your email. By default a time/date stamp and the user who generated the email are included. 

    .PARAMETER whatcc
    Specify a individual you wish to include in CC

    .PARAMETER whatbcc
    Specify a individual you wish to include in BCC

    .PARAMETER AddLevon
    Add this and it will include Levon in CC Field 

    .PARAMETER AddMatt
    Add this and it will include Matt in CC Field 

    .PARAMETER AddBrady
    Add this and it will include Brady in CC Field 

    .PARAMETER AddBoth
    Add this and it will include Levon and Matt in CC Field 

    .PARAMETER AddRyan
    Add this and it will include Ryan in CC Field 

    .PARAMETER AddCassie
    Add this and it will include Cassie in CC Field 

    .PARAMETER CRBlind
    Add this and it will include Cassie in BCC Field 

    .PARAMETER AllBlind
    Add this and it will include Matt, Levon and Cassie in BCC Field

    .PARAMETER LKBlind
    Add this and it will include Levon in BCC Field 

    .PARAMETER MSBlind
    Add this and it will include Matt in BCC Field 

    .PARAMETER attachments
    Parameter description

    .EXAMPLE
    Email-BlastCLR -EnterSubject "No CC/BCC/Attach" -EnterBody "#1"

    .EXAMPLE
    Email-BlastCLR -EnterSubject "No BCC/Attach -CC Manual" -EnterBody "#2" -whatcc "Rottc@casscountynd.gov"

    .EXAMPLE
    Email-BlastCLR -EnterSubject "No CC/Attach -BCC Manual" -EnterBody "#3" -whatbcc "Rottc@casscountynd.gov"

    .EXAMPLE
    Email-BlastCLR -EnterSubject "No BCC or Attach Added -AddBoth -CC Manual" -EnterBody "#4" -whatcc "Rottc@casscountynd.gov" -AddBoth

    <#
    .SYNOPSIS
    Send email to Cassie and other specified individuals. 

    .DESCRIPTION
    I have tried to think of all the variations in how an email is sent - from Attachments to CC/BCC. 

    .PARAMETER EnterSubject

#>
    [CmdletBinding()]
    Param(
           [Parameter(Mandatory=$True)]        
            [alias("Subject")]
            $EnterSubject,
            [Parameter(Mandatory=$True)]   
            [alias("Body")]
            $EnterBody,

            [alias("cc")]
            $whatcc,
            [alias("bcc")]
            $whatbcc,
    
            [switch]$AddLevon,
            [switch]$AddMatt,
            [switch]$AddBrady,
            [switch]$AddAll,
            [switch]$AddCassie,
            [switch]$AddRyan,
            [switch]$AddJaden,
            [switch]$CRBlind,
            [switch]$AllBlind,
            [switch]$LKBlind,
            [switch]$MSBlind,
            [switch]$personalcellphone,
            [switch]$workcell,
            [switch]$Levoncell,
            [switch]$Mattcell,
            [switch]$html,
            
            [alias("Attach")]
            $attachments
    ) 
    #End of Parameters

          #Reference for Time later on the script
        function Get-TimeStamp {
        return "[{0:MM/dd/yy} {0:hh:mm:ss tt}]" -f (Get-Date)
        }         

#Define Preset individuals in parameter switches to include in CC 

    #These never change - variables for email messages
          $CLRRecipient = "rottc@casscountynd.gov"
          $smtpServer = "smtp"
          $from = "no-reply@casscountynd.gov "
          $MainBody = "`n$EnterBody`n"  + "`n$(Get-TimeStamp)"+"`nEmail sent by $env:USERNAME`n" + "Sent From Device: $Env:COMPUTERNAME`n"



# We just add whoever is CC'd to this, then pass this to the cmdlet
    $cc_people = @()
    $bcc_people = @()

                If ($AddMatt){
                    $ccMatt = "stewartm@casscountynd.gov"
                    $cc_people += $ccMatt
                    #Write-Host "Including Matt as CC"
                }
                If ($AddLevon){
                    $Levon = "kohoutekl@casscountynd.gov"
                    $cc_people += $Levon
                    #Write-Host "Including Levon as CC"
                }
                If ($AddAll){
                    $ccBoth = "kohoutekl@casscountynd.gov"
                    $ccBothMS = "stewartm@casscountynd.gov"
                    $cc_people += $ccBoth
                    $cc_people += $ccBothMS
                    # Write-Host "Both and Matt and Levon are included on this email"
                }
                If ($AddBrady){
                    $Brady = "brudvikb@casscountynd.gov"
                    $cc_people += $Brady
                    #Write-Host "Including Brady as CC"
                }
                if ($Personalcellphone){
                    $cc_people += "7012692264@vtext.com"
                }
                if ($workcell){
                    $cc_people += "7015268193@vzwpix.com"
                }
                If ($cc){
                    $cc_people += $cc
                    #Write-Host "Including $cc"
                }
                if ($whatcc) {
                    $cc_people += $whatcc
                }
                if ($whatbcc){
                    $bcc_people += $whatbcc
                }
                If ($bcc){
                    $bcc_people += $bcc
                }
                If ($AddJaden){
                    $Jaden = "MayJ@casscountynd.gov"
                    $cc_people += $Jaden
                }
                If ($AddRyan){
                    $Ryan = "diedrichr@casscountynd.gov"
                    $cc_people += $Ryan
                }
                If ($AddCassie){
                    $Cassie = "rottc@casscountynd.gov"
                    $cc_people += $Cassie
                }
                If ($CRBlind){
                    $BCCCassie = "Rottc@casscountynd.gov"
                    $bcc_people += $BCCCassie
                }
                If ($AllBlind){
                    $bcc1 = "rottc@casscountynd.gov"
                    $bcc2 = "kohoutekl@casscountynd.gov"
                    $bcc3 = "stewartm@casscountynd.gov"
                    $bcc_people += $bcc1
                    $bcc_people += $bcc2
                    $bcc_people += $bcc3
                }
                If ($MSBlind){
                    $bccMatt = "stewartm@casscountynd.gov"
                    $bcc_people += $bccMatt
                }
                If ($LKBlind){
                    $bccLevon = "kohoutekl@casscountynd.gov"
                    $bcc_people += $bccLevon
                }
 #$cc_people 
 #$bcc_people 

############ Evaluate for HTML  ####################
    if ($html.IsPresent ){
        #Subject with appropriate line returns for html msgs
          $MainBody = "<br>$EnterBody<br>"  + "<br>$(Get-TimeStamp)"+"<br>-v-Email sent by $env:USERNAME-^-<br>" + "Sent From Device: $Env:COMPUTERNAME<br>"

            ############ Are there any attachments ####################

            if ($attachments -ne $null){

                ##Check if CC is listed##
                    If ($cc_people.count -ne 0) {
                        ##### Check for BCC in addition to CC #####
                        If ($bcc_people.count -ne 0) {
                            Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Bcc $bcc_people -Attachments $attachments -BodyAsHtml
                            Write-Host "Sent Email to $CLRRecipient with CC $cc_people and BCC $bcc_people" -ForegroundColor Green
                            Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                            return
                        }

                        ##### No BCC listed just send with CC ##### 
                        Else {
                        Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Attachments $attachments -BodyAsHtml
                        Write-Host "Sent email to $CLRRecipient and CC $cc_people" -ForegroundColor Green
                        Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                        return
                        }
                    }

                ##Needs to check if BCC exists when there isn't a CC
                    If ($bcc_people -ne $null) {
                            Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BCC $bcc_people -Attachments $attachments -BodyAsHtml
                            Write-Host "Sent Email to $CLRRecipient with BCC $bcc_people" -ForegroundColor Magenta
                            Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                            return
                        }  
            
            ##Didn't find a CC or BCC - sending with Attachments only
                Else {
                    Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -Attachments $attachments -BodyAsHtml
                        Write-Host "Sent Email to $CLRRecipient" -ForegroundColor Green
                        Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                        return
                }

            }

            ############ No Attachments Found Evaluating CC & BCC ####################
            ##Check if there is a CC added
                If ($cc_people.count -ne 0) {

                    ##### Check for BCC in addition to CC #####
                        if ($bcc_people.count -ne 0) {
                            Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Bcc $bcc_people -BodyAsHtml
                            Write-Host "Sent Email to $CLRRecipient with CC $cc_people and BCC $bcc_people" -ForegroundColor Green
                            return
                        }

                        Else {
                        Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -BodyAsHtml
                        Write-Host "Sent email to $CLRRecipient and CC $cc_people" -ForegroundColor Green
                        return
                        }
                }

            ##Needs to check if BCC exists when there isn't a CC
                If ($bcc_people.count -ne 0) {
                    Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BCC $bcc_people -BodyAsHtml
                    Write-Host "Sent Email to $CLRRecipient with BCC $bcc_people no one listed as CC" -ForegroundColor Green
                    return
                }  



            ############ No Attachments and No CC or BCC#################### 
            Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BodyAsHtml
            Write-Host "`n If you don't seen any errors the email has been sent to $CLRrecipient" -ForegroundColor Magenta
            return
    }

############ End of HTML ####################


############ Start Plain Text Email ############ 
   
    ############ Are there any attachments  ####################
        if ($attachments -ne $null){
                ##Check if CC is listed##
                      If ($cc_people.count -ne 0) {
            
                         ##### Check for BCC in addition to CC #####
                        If ($bcc_people.count -ne 0) {
                            Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Bcc $bcc_people -Attachments $attachments
                            Write-Host "Sent Email to $CLRRecipient with CC $cc_people and BCC $bcc_people" -ForegroundColor Green
                            Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                            return
                        }

                        ##### No BCC listed just send with CC ##### 
                        Else {
                          Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Attachments $attachments
                          Write-Host "Sent email to $CLRRecipient and CC $cc_people" -ForegroundColor Green
                          Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                          return
                        }
                      }
        
                ##Needs to check if BCC exists when there isn't a CC
                      If ($bcc_people -ne $null) {
                            Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BCC $bcc_people -Attachments $attachments
                            Write-Host "Sent Email to $CLRRecipient with BCC $bcc_people" -ForegroundColor Magenta
                            Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                            return
                        }  
             
               ##Didn't find a CC or BCC - sending with Attachments only
                Else {
                    Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -Attachments $attachments
                        Write-Host "Sent Email to $CLRRecipient" -ForegroundColor Green
                        Write-Host "The following was attached to the email: `n $attachments" -ForegroundColor Cyan
                        return
                }
      
      } #?

 ############ No Attachments Found Evaluating CC & BCC ####################

        ##Check if there is a CC added
                If ($cc_people.count -ne 0) {
            
                    ##### Check for BCC in addition to CC #####
                        if ($bcc_people.count -ne 0) {
                            Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Bcc $bcc_people
                            Write-Host "Sent Email to $CLRRecipient with CC $cc_people and BCC $bcc_people" -ForegroundColor Green
                            return
                        }
    
                        Else {
                          Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people
                          Write-Host "Sent email to $CLRRecipient and CC $cc_people" -ForegroundColor Green
                          return
                        }
                }
        
        ##Needs to check if BCC exists when there isn't a CC
                If ($bcc_people.count -ne 0) {
                    Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BCC $bcc_people
                    Write-Host "Sent Email to $CLRRecipient with BCC $bcc_people no one listed as CC" -ForegroundColor Green
                    return
                }  
  


############ No Attachments and No CC or BCC or HTML #################### 
    Send-MailMessage -To $CLRRecipient -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer 
    Write-Host "`n If you don't seen any errors the email has been sent to $CLRrecipient" -ForegroundColor Magenta

}
#End of Function

####################End of CLR Email Function ##########################################################################

function Email-blastCell () {

    [CmdletBinding()]
    Param(
           [Parameter(Mandatory=$True)]        
            [alias("Subject")]
            $EnterSubject,
            [Parameter(Mandatory=$True)]   
            [alias("Body")]
            $EnterBody,
            [Parameter(Mandatory=$False)]
            [alias("To")]
            [string]$AliasOnly,

            [alias("cc")]
            $whatcc,
            [alias("bcc")]
            $whatbcc,
            [switch]$AddLevon,
            [switch]$AddMatt,
            [switch]$AddBrady,
            [switch]$AddAll,
            [switch]$AddCassie,
            [switch]$AddRyan,
            [switch]$CRBlind,
            [switch]$AllBlind,
            [switch]$LKBlind,
            [switch]$MSBlind,
            [switch]$AddJaden,
            [switch]$personalcellphone,
            [switch]$workcell,
            [switch]$Levoncell,
            [switch]$Mattcell,
            [switch]$html,
            
            [alias("Attach")]
            $attachments
    )
       #Reference for Time later on the script
       function Get-TimeStamp {
        return "[{0:MM/dd/yy} {0:hh:mm:ss tt}]" -f (Get-Date)
        }           
           
    #These never change - variables for email messages
          $smtpServer = "smtp"
          $from = "no-reply@casscountynd.gov"
          $MainBody = "`n$EnterBody`n"  + "`n$(Get-TimeStamp)"+"`nEmail sent by $env:USERNAME`n" + "Sent From Device: $Env:COMPUTERNAME`n"
          $cello = "7015268193@vzwpix.com"
          
#Define Preset individuals in parameter switches to include in CC 
    $cc_people = @()
    $bcc_people = @()
    $celladds = @()
    
            If ($AddMatt){
                $ccMatt = "stewartm@casscountynd.gov"
                $cc_people += $ccMatt
            }
            If ($AddLevon){
                $Levon = "kohoutekl@casscountynd.gov"
                $cc_people += $Levon
            }
            If ($AddAll){
                $ccBoth = "kohoutekl@casscountynd.gov"
                $ccBothMS = "stewartm@casscountynd.gov"
                $ccCLR = "rottc@casscountynd.gov"
                $cc_people += $ccBoth
                $cc_people += $ccBothMS
                $cc_people += $ccCLR
            }
            If ($AddBrady){
                $Brady = "brudvikb@casscountynd.gov"
                $cc_people += $Brady
            }
            If ($cc){
                $cc_people += $cc
            }
            if ($whatcc) {
                $cc_people += $whatcc
            }
            if ($whatbcc){
                $bcc_people += $whatbcc
            }
            if ($Personalcellphone){
                $clrpersonalcell = "7012692264@vtext.com"
                $cc_people += $clrpersonalcell
                #$celladds += $clrpersonalcell
            }
            if ($workcell){
                $clrworkcell = "7015268193@vzwpix.com"
                $cc_people += $clrworkcell
            }
            if ($Mattcell){
                $mattworkcell = "7018665742@vzwpix.com"
                $cc_people += $mattworkcell
            }
            if ($Levoncell){
                $levonworkcell = "7016302827@vzwpix.com"
                $cc_people += $levonworkcell 
            }


############ No Attachments Found Evaluating CC & BCC ####################

    ##Check if there is a CC added
            If ($cc_people.count -ne 0) {
        
                ##### Check for BCC in addition to CC #####
                    if ($bcc_people.count -ne 0) {
                        Send-MailMessage -To $cello -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people -Bcc $bcc_people
                        Write-Host "Sent Email to $cello with CC $cc_people and BCC $bcc_people" -ForegroundColor Green
                        Return
                    }

                    Else {
                      Send-MailMessage -To $cello -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -CC $cc_people
                      Write-Host "Sent email to $cello and CC $cc_people" -ForegroundColor Green
                      Return
                    }
            }
    
    ##Needs to check if BCC exists when there isn't a CC
            If ($bcc_people.count -ne 0) {
                Send-MailMessage -To $cello -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer -BCC $bcc_people
                Write-Host "Sent Email to $cello with BCC $bcc_people no one listed as CC" -ForegroundColor Green
                Return
            }  


############ No Attachments and No CC or BCC #################### 
Send-MailMessage -To $cello  -From $from -Subject $EnterSubject -Body $MainBody -SmtpServer $smtpServer 
Write-Host "`n If you don't seen any errors the email has been sent to $cello" -ForegroundColor Magenta

}

#####***************************************************************#####

Function Whats-theNumber () {
    [CmdletBinding()]
    Param(
         [Parameter(Mandatory=$True)]        
           [string]$Descript
        )
    <#
    .SYNOPSIS
    Will pull up the computer number and IP based on the description field in AD
    
    .EXAMPLE
    Whats-theNumber -descript brud 
    Lookup the information based on a portion of the name - this will pull up every entry with Cassi in that order
        Name     Description                   IPAddress    CanonicalName
        ----     -----------                   ---------    -------------
        C1011315 Brady Brudvik - Surface Pro 4              co.cass.nd.us/Cass County/Internal/Laptops/ITD/Tablets/C1011315
        C1012931 Brady Brudvik                 10.99.130.24 co.cass.nd.us/Cass County/Internal/Desktops/ITD/C1012931

    .EXAMPLE
    Whats-theNumber rott
    The -descript portion is not necessary with this function so you can type part of the descript as shown below.

        Name     Description                 IPAddress                                CanonicalName
        ----     -----------                 ---------                                -------------
        C1011724 Cassie Rott - Surface Pro 4 10.99.128.113                            co.cass.nd.us/Cass County/Internal/Laptops/ITD/Tablets/C1011724

    .Example
    Whats-theNumber Cas*sie 
    Use * as a wildcard in case you don't know how to spell something or want to ensure your entries. 
        
        Name     Description                 IPAddress                                CanonicalName
        ----     -----------                 ---------                                -------------
        C1011726 Cassie Rott                 {fe80::884f:184f:7968:8fb, 10.99.130.16} co.cass.nd.us/Cass County/Internal/Desktops/ITD/C1011726
        C1011724 Cassie Rott - Surface Pro 4 10.99.128.113                            co.cass.nd.us/Cass County/Internal/Laptops/ITD/Tablets/C1011724
   
        .DESCRIPTION
    In the description field for computer objects in Active Directory we list the names of the individual assigned to the device. This will look in that field based on a partial or whole entry and pull back the AD computer number and IP address (IP Portion still being refined).
#>
$Description = $Descript

$PC = Get-ADComputer -Filter "Description -like '*$Description*'" -Properties Name,Description,CanonicalName |
Select-Object -Property @(
        'Name'
        'Description'
        'CanonicalName'
        @{ N = 'IPAddress'
           E = {(Resolve-DnsName -Name $_.Name).IPAddress}
         }
    )
    $PC | Format-Table -Property Name,Description,IPAddress,CanonicalName -AutoSize -Wrap
    

}


Function Yellow-Pages() {
    [CmdletBinding()]
    Param(
         [Parameter(Mandatory=$True)]        
           [string]$num
           )
    <#
    .SYNOPSIS
     Look up a computer details by the number listed in AD - can include or exclude the C at the beginning
    
    .EXAMPLE
     Yellow-Pages -num c1011726
            Name     Description IPAddress                                CanonicalName
            ----     ----------- ---------                                -------------
            C1011726 Cassie Rott {fe80::884f:184f:7968:8fb, 10.99.130.16} co.cass.nd.us/Cass County/Internal/Desktops/ITD/C1011726
    .EXAMPLE
     Yellow-Pages 1011726
     Leave off the C at the beginning and the script will add it for you. 
      
            Name     Description IPAddress                                CanonicalName
            ----     ----------- ---------                                -------------
            C1011726 Cassie Rott {fe80::884f:184f:7968:8fb, 10.99.130.16} co.cass.nd.us/Cass County/Internal/Desktops/ITD/C1011726

    .EXAMPLE
     Yellow-Pages 10*1172
     Wildcard search - this will pull up anything with those numbers
            Name     Description                  IPAddress                                CanonicalName
            ----     -----------                  ---------                                -------------
            C1011726 Cassie Rott                  {fe80::884f:184f:7968:8fb, 10.99.130.16} co.cass.nd.us/Cass County/Internal/Desktops/ITD/C1011726
            C1011729 Curtis Crowe - Surface Pro 4                                          co.cass.nd.us/Cass County/Internal/Laptops/HWY/Tablets/C1011729
            C1011728 Jason Benson - Surface Pro 4 10.99.168.53                             co.cass.nd.us/Cass County/Internal/Laptops/HWY/Tablets/C1011728
            C1011724 Cassie Rott - Surface Pro 4  10.99.128.113                            co.cass.nd.us/Cass County/Internal/Laptops/ITD/Tablets/C1011724
        
    .DESCRIPTION
     You should be able to put 2 & 2 together on this stuff. If not please close powershell. 
#>
    
            $PCNumber = $num 
            $PCInfo = Get-ADComputer -Filter "Name -like '*$PCNumber*'" -Properties Name,Description,CanonicalName |
            Select-Object -Property @(
                    'Name'
                    'Description'
                    'CanonicalName'
                    @{ N = 'IPAddress'
                    E = {(Resolve-DnsName -Name $_.Name).IPAddress}
                    }
                )
                $PCInfo | Format-Table -Property Name,Description,IPAddress,CanonicalName -AutoSize -Wrap
    
    }

Function Rename-Stuff() {
    <#
    .SYNOPSIS
    Choice needs to be made between changing description of Computer or Changing its Name and rebooting.
    
    .PARAMETER device
    Enter the computer number that you are changing - Mandatory Parameter if you do not define it you will be prompted
    
    rename-stuff 
    cmdlet Rename-Stuff at command pipeline position 1
    Supply values for the following parameters:
    device: 
    
    .EXAMPLE
    TO make a change to the description
    Rename-Stuff C1011705
    
    Are we changing description (1) OR renaming a PC (2) [Choose 1/2]: 1
    What's the new description: Jolene Heising - Desktop
    
    Description has been changed see below
    
    Name     Description              CanonicalName                                           
    ----     -----------              -------------                                           
    C1011705 Jolene Heising - Desktop co.cass.nd.us/Cass County/Internal/Desktops/ITD/C1011705
    
    .EXAMPLE
    To Make a change to the computer name - * You need Admin elevation to do this * 
    rename-stuff c1011724
    
    Are we changing description (1) OR renaming a PC (2) [Choose 1/2]: 2
    You are seriously renaming this PC? It will automatically reboot on you. [y/n]: y
    
    What is the new name?: C1011724-CLR
    
    #>
    
        [CmdletBinding()]
         Param(
              [Parameter(Mandatory=$True)]        
                [string]$device
            )
    
        $whatyoudoin = Read-Host "Are we changing description (1) OR renaming a PC (2) [Choose 1/2]"
        
        if($whatyoudoin -eq "1"){
            $newdescript = Read-Host "What's the new description"
            Set-ADComputer -Identity $device -Description "$newdescript" 
    
            Write-Host "Description has been changed see below" -ForegroundColor Cyan
            Get-ADComputer -identity $device -Properties Name,description,CanonicalName | FT -Property Name,Description,CanonicalName -AutoSize -Wrap
            
            Break
        }
    
        if($whatyoudoin -eq "2"){
            
            $yousure = Read-Host "You are seriously renaming this PC? It will automatically reboot on you. [y/n]"
             
                If($yousure -eq "y") {
                    $devicerename = Read-Host "What is the new name?"
                    Rename-Computer -ComputerName $device -NewName $devicerename -Restart
                }
                if ($yousure -ne "y") {
                    Write-Host "If you aren't sure its probably for the best. Peace Out" -ForegroundColor Green
                    Break
                }
            
        }
        else {
            Write-Host "Correct choice not made - you only had to pick 1 or 2" -ForegroundColor Yellow
        }
    }


################################################################
Function WhoIs-LockedOut {
    $backups = [array]$users = Search-ADAccount -LockedOut
    $countofback = $backups.Count
    
    #$backups
       #If the user count has more than one option - it will print out a menu and ask the user to make a choice
               if($countofback -ne 0){
                   Write-Host -ForegroundColor Green "Users that are locked:"  
   
                   For ($i=0;$i -lt $countofback; $i++){
                       Write-Host -ForegroundColor Red "$($i): $(($backups[$i]).SamAccountName)"      
                       }
   
                       Do {
                           $selection = Read-Host `n "Enter the number of the user for unlock in q to quit"  
                           If ($selection -NotLike "q*"){
                               $selection = $selection -as [int]
                               $DoThisUser = $backups[$selection]
                           }   
                   }
                   Until (($selection -lt $countofback -AND $selection -match "\d") -OR $selection -Like "q*")  
          
               }
   
   
           #Print to screen and stop if no users are found   
               elseif ($countofback -lt 1) {
                   Write-Host "Nothing Found"  -ForegroundColor Red
                   break
               }
   
           #Stop if they hit q
           If ($selection -Like "q*") {  
               Break  
               }    
   
       $unlockme = ($DoThisUser).SamAccountName
       
       Unlock-User $unlockme
   
       }
 
################################################################

    Function LockThem-Out () {
    [CmdletBinding()]
        Param (
                [Parameter(Mandatory=$True)]        
                [string]$Unlock
                )
    
    $RULocked = Get-ADUser $Unlock 
    
    
    $Password = ConvertTo-SecureString 'NotMyPassword' -AsPlainText -Force
     
    Get-ADUser $unlock -Properties SamAccountName, UserPrincipalName, LockedOut |
    ForEach-Object {
    
     Do {
     
         Invoke-Command -ComputerName C9svr119v {Get-Process
          } -Credential (New-Object System.Management.Automation.PSCredential ($($_.UserPrincipalName), $Password)) -ErrorAction SilentlyContinue
     
                }
                Until ((Get-ADUser -Identity $_.SamAccountName -Properties LockedOut).LockedOut)
                Set-ADuser -Identity $Unlock -ChangePasswordAtLogon $True
                Write-Output "$($_.SamAccountName) has been locked out"
        }
    }


################################################################

    Function ChngPass () {
        [CmdletBinding()]
        Param (
                [Parameter(Mandatory=$True)]        
                [string]$person
                )

        Get-ADUser $person | Set-ADUser -ChangePasswordAtLogon $true
        Write-Host "User is now flagged to change their password at next login"

    }
#####***************************************************************#####
### Do run through of description and if that doesn't work then run computer number
Function Ferret-Out() { 

[CmdletBinding()]
Param(
     [Parameter(Mandatory=$True)]        
       [string]$thestuff
       )
    #Evaluate if the entry was Integer
    #    $eval = $thestuff -is [int32]

    <#
    .SYNOPSIS
     Look up a computer details by the number or description listed in AD
    
    .EXAMPLE
        Ferret-Out 101170

        Name     Description                   IPAddress     CanonicalName
        ----     -----------                   ---------     -------------
        C1011700 Mickey Harmon - Surface Pro 4 10.99.150.18  co.cass.nd.us/Cass County/Internal/Laptops/CSO/LEC/Sheriff/Tablets/C1011700
        C1011702 Tim Briggeman - Surface Pro 4 10.99.150.55  co.cass.nd.us/Cass County/Internal/Laptops/CSO/LEC/Sheriff/Tablets/C1011702
    .Example 
        Ferret-Out koho

        Name     Description                    IPAddress    CanonicalName
        ----     -----------                    ---------    -------------
        C1009416 Levon Kohoutek - Old Desktop                co.cass.nd.us/Cass County/Internal/Desktops/ITD/C1009416
        C1010096 Levon Kohoutek - Surface Pro 2              co.cass.nd.us/Cass County/Internal/Laptops/ITD/Tablets/C1010096

    .EXAMPLE
    Wildcard Searches    
        Ferret-Out bru*ik

        Name     Description                   IPAddress    CanonicalName
        ----     -----------                   ---------    -------------
        C1011315 Brady Brudvik - Surface Pro 4              co.cass.nd.us/Cass County/Internal/Laptops/ITD/Tablets/C1011315
        C1012931 Brady Brudvik                 10.99.130.24 co.cass.nd.us/Cass County/Internal/Desktops/ITD/C1012931
      
        
    .DESCRIPTION
     You should be able to put 2 & 2 together on this stuff. If not please close powershell. 
#>

####### 

   If ($thestuff -is [String] ) {
    $Description = $thestuff
            $PC = Get-ADComputer -Filter "Description -like '*$Description*'" -Properties Name,Description,CanonicalName |
            Select-Object -Property @(
                'Name'
                'Description'
                'CanonicalName'
                @{ N = 'IPAddress'
                E = {(Resolve-DnsName -Name $_.Name).IPAddress}
                }
        )

        If ($pc -ne $null){
            $PC | Format-Table -Property Name,Description,IPAddress,CanonicalName -AutoSize -Wrap
            return
        }

        if ($thestuff -like "10.99.*"){
            #Write-Host "yah $thestuff"
            IPLook -EntireIP $thestuff
            Return
        }
    
        ##If its a string (has any letters in it) but its not found in the description search it will search the PC field 

        ElseIf ($pc -eq $null) {
            $PCNumber = $thestuff
            $PCInfo = Get-ADComputer -Filter "Name -like '*$PCNumber*'" -Properties Name,Description,CanonicalName |
            Select-Object -Property @(
                    'Name'
                    'Description'
                    'CanonicalName'
                    @{ N = 'IPAddress'
                    E = {(Resolve-DnsName -Name $_.Name).IPAddress}
                    }
                )
            $PCInfo | Format-Table -Property Name,Description,IPAddress,CanonicalName -AutoSize -Wrap
            return
            }

   }  
    ####### Computer number 
    ##Not sure how to adjust this so you don't need the C1 - shiz. Would like to get partial searches. 
    If ($thestuff -is [Int32]) {
            $PCNumber = $thestuff
            $PCInfo = Get-ADComputer -Filter "Name -like '*$PCNumber*'" -Properties Name,Description,CanonicalName |
            Select-Object -Property @(
                    'Name'
                    'Description'
                    'CanonicalName'
                    @{ N = 'IPAddress'
                    E = {(Resolve-DnsName -Name $_.Name).IPAddress}
                    }
                )
            $PCInfo | Format-Table -Property Name,Description,IPAddress,CanonicalName -AutoSize -Wrap
            return
            }


}
#####***************************************************************#####
Function Unlock-User() {

[CmdletBinding()]
Param (
    
    [Parameter(Mandatory=$True)] 
    [String]$User
    )
<#
    .SYNOPSIS
    This allows us to unlock an AD account and change password if needed. 
    .PARAMETER EnterSubject
    Mandatory - enter the alias of the user you want to work with

    .EXAMPLE
     **User is not locked and password did not need to be changed
     User-Unlock rottc
        Not Locked - Did you want to change their password to County.123??
        ( y / n ) : n
        You are on your own homeslice - Good Luck dealing with rottc

    **User is locked out but doesn't need a password change. 
     
    User-Unlock hjalmquistd
        Ok I just unlocked hjalmquistd... Did they also forget their password??
        ( y / n ) : n
        Unlocked hjalmquistd - they are free to mess it up again     
#>


$Unlock = $User #Read-Host "Yet another lockout... What's the Alias?"
$RULocked = Get-ADUser $Unlock -Properties lockedout
$newpwd = ConvertTo-SecureString -String "County.123" -AsPlainText -Force

###########Is the Acct Locked###########
###########  Yes  ###########
    if ($RULocked.LockedOut -eq $True) {
    Unlock-ADAccount $Unlock

        Write-Host `n " Ok I just unlocked $Unlock... Did they also forget their password??" -ForegroundColor Yellow 
            $ReadHost = Read-Host " ( y / n ) " 
            Switch ($ReadHost) 
            { 
                Y {Set-ADAccountPassword -Identity $Unlock -Reset -NewPassword $newpwd
                Set-ADuser -Identity $Unlock -ChangePasswordAtLogon $True
                Write-Host `n "Unlocked, New Password is: County.123  - $Unlock will need to chng pass at next login `n" -ForegroundColor Red
            }

            N {Write-Host `n "Unlocked $Unlock - they are free to mess it up again `n" -ForegroundColor Yellow} 
            Default {Write-Host "You didn't select a response. Moving on..." -ForegroundColor Magenta} 
        
             }
        }


    ########### NO ###########
    if ($RULocked.LockedOut -eq $False) {
        Write-Host " Not Locked - Did you want to change their password to 'County.123'?" -ForegroundColor Yellow 
            $ReadHost = Read-Host " ( y / n ) " 
            Switch ($ReadHost) { 

        Y {Set-ADAccountPassword -Identity $Unlock -Reset -NewPassword $newpwd
        Set-ADuser -Identity $Unlock -ChangePasswordAtLogon $True
        Write-Host " Unlocked, Password Changed $Unlock will need to chng pass at next login `n" -ForegroundColor Green 
    }

    N {Write-Host "You are on your own homeslice - Good Luck dealing with $Unlock" -ForegroundColor Green
    } 

    Default {Write-Host "You didn't select a response. Moving on..." -ForegroundColor Magenta}
            }
        }
}

New-Alias -name Unlock Unlock-User
#####***************************************************************#####
Function Delete-Profile() {
  
<#
    .SYNOPSIS
     This can mess stuff up - be careful! 
     Connect to a remote machine by entering computer number and then deleting user profiles folder and associated registry key from the device. 
    
    .EXAMPLE
     Delete-Profile C1011951
            User profiles on c1011951:
                0: Administrator
                1: allenk
                2: olsonc
                3: martinj
                20: stafkis
                21: hegerb
                22: ThomsenJ
                23: violetk
                24: StirlingM
                q: Quit
            Select a number to delete local profile or 'q' to quit: 


            Select a number to delete local profile or 'q' to quit: 24
                Deleting profile: StirlingM
                Profile:  StirlingM has been deleted

            Remove Another Profile?
            [Y] Yes [N] No [?] Help (default is "Yes"):


    .DESCRIPTION
            Warning: this deleted the user profile if they have saved files they need you will need to back those up first. 
#>

[CmdletBinding()]
Param (
    [Parameter(Mandatory=$True)]        
      [string]$computer
     )

    If ($computer -ne $Env:Computername) {  
        If (!(Test-Connection -comp $computer -count 1 -quiet)) {  
            Write-Warning "$computer is not accessible, please try a different computer or verify it is powered on."  
            Break  
            }  
        }  
    Do {      
    #Gather all of the user profiles on computer  
        Try {  
            [array]$users = Get-WmiObject -ComputerName $computer Win32_UserProfile -filter "LocalPath Like 'C:\\Users\\%'" -ea stop  
            }  
        Catch {  
            Write-Warning "$($error[0]) "  
            Break  
            }      
    
    #Cache the number of users  
    $num_users = $users.count  
    
    Write-Host -ForegroundColor Green "User profiles on $($computer):"  
    
        #Begin iterating through all of the accounts to display  
        For ($i=0;$i -lt $num_users; $i++) {  
            Write-Host -ForegroundColor Green "$($i): $(($users[$i].localpath).replace('C:\Users\',''))"  
            }  
        Write-Host -ForegroundColor Green "q: Quit"  
      
        #Prompt for user to select a profile to remove from computer  
        Do {      
            $account = Read-Host "Select a number to delete local profile or 'q' to quit"  
            #Find out if user selected to quit, otherwise answer is an integer  
            If ($account -NotLike "q*") {  
                $account = $account -as [int]  
                }  
            }          
       
            #Ensure that the selection is a number and within the valid range  
        Until (($account -lt $num_users -AND $account -match "\d") -OR $account -Like "q*")  
        If ($account -Like "q*") {  
            Break  
            }  
                Write-Host -ForegroundColor Yellow "Deleting profile: $(($users[$account].localpath).replace('C:\Users\',''))"  
                #Remove the local profile  
                    ($users[$account]).Delete()  
                    Write-Host -ForegroundColor Magenta "Profile:  $(($users[$account].localpath).replace('C:\Users\','')) has been deleted"  
    
            #Configure yes choice  
            $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","Remove another profile."  
        
            #Configure no choice  
            $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Quit profile removal"  
        
            #Determine Values for Choice  
            $choice = [System.Management.Automation.Host.ChoiceDescription[]] @($yes,$no)  
        
            #Determine Default Selection  
            [int]$default = 0  
        
            #Present choice option to user  
            $userchoice = $host.ui.PromptforChoice("","Remove Another Profile?",$choice,$default)  
        }  
        #If user selects No, then quit the script      
        Until ($userchoice -eq 1)
    }

#####***************************************************************#####
Function Contact-Card {
 
 <#
 .Synopsis
  Returns a customized list of Active Directory account information for a single user
 
 .Description
  Returns a customized list of Active Directory account information for a single user. The customized list is a combination of the fields that
  are most commonly needed to review when an employee calls the helpdesk for assistance.
 
 .Example
  Returns a customized list of AD account information 
 
  PS C:\Scripts> Contact-Card rottc
 
        Name         : Cassie Rott
        Name     : RottC
        Title        : IT Specialist II
        Department   : Information Technology
        Building     : Addition
        Manager      : SchmaltzT
        DisplayNme   : Rott, Cassie
        EmailAddress : RottC@casscountynd.gov
        OfficePhone  : (701) 241-5719
        MobilePhone  :

        PasswordExpired       : False
        AccountLockedOut      : False
        LockOutTime           :
        AccountEnabled        : True
        AccountExpirationDate :
        PasswordLastSet       : 10/1/2018 9:49:47 AM
        PasswordExpireDate    : 12/30/2018 8:49:47 AM
 
 .Parameter UserName
  The employee account to lookup in Active Directory

#>
 
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, Position = 1)]
        [string]$Name
    )
 
    #Import AD Module
    #Import-Module ActiveDirectory
    
    #Find user information based on partial description and grab the alias and do a count
    $WildEmployee = Get-ADuser -Filter "Name -like '*$Name*'" -Properties * 
    $AliasEmploy = $WildEmployee.SamAccountName
    $numusers = $AliasEmploy.count
    

    #If the user count has more than one option - it will print out a menu and ask the user to make a choice
        if($numusers -gt 1){
            Write-Host -ForegroundColor Green "Users that are like $($Name):"  

            For ($i=0;$i -lt $numusers; $i++){
                Write-Host -ForegroundColor Red "$($i): $(($AliasEmploy[$i]))"  
                }

            Do {
                $selection = Read-Host "Enter the number of the user you wish to look up or put in q to quit" 
                If ($selection -NotLike "q*"){
                    $selection = $selection -as [int]
                    $DoThisUser = $AliasEmploy[$selection]
                }   
            }
            Until (($selection -lt $numusers -AND $selection -match "\d") -OR $selection -Like "q*")  
        }
    #Print to screen and stop if no users are found   
        elseif ($numusers -lt 1) {
            Write-Host "$Name not found" -ForegroundColor Yellow
            break
        }

     #This will do a one to one match 
        elseif ($numusers -eq 1) {
                $DoThisUser = $AliasEmploy
               
        }

        If ($selection -Like "q*") {  
            Break  
            }         
        
    #The stuff that will pull the user's contact information and throw it on the screen
 
    $Employee = Get-ADuser $DoThisUser -Properties *, 'msDS-UserPasswordExpiryTimeComputed'
    #$ManagerTest = ((Get-ADUser $Employee.manager).samaccountname)

            if($Employee.manager -eq $false) {
                $Manager = "No Manager"
            }
            elseif ($Employee.manager -ne $null) {
                $Manager = ((Get-ADUser $Employee.manager).samaccountname)
            }



    #$Manager = ((Get-ADUser $Employee.manager).samaccountname)
    $PasswordExpiry = [datetime]::FromFileTime($Employee.'msDS-UserPasswordExpiryTimeComputed')
 
                
      $AccountInfo = [PSCustomObject]@{
            Name         = $Employee.GivenName + " " + $Employee.Surname
            #LastName     = $Employee.Surname
            UserName     = $Employee.SamAccountName
            Title        = $Employee.Title
            Department   = $Employee.department
            Building     = $Employee.Office
            Manager      = $Manager + "`n"
            #City         = $Employee.city
            #EmployeeID   = $Employee.EmployeeID
            ADLocation   = $Employee.CanonicalName
            
            DisplayNme   = $Employee.displayname
            EmailAddress = $Employee.emailaddress
            OfficePhone  = $Employee.officephone
            MobilePhone  = $Employee.mobilephone
    }
 
      $AccountStatus = [PSCustomObject]@{
            PasswordExpired       = $Employee.PasswordExpired
            AccountLockedOut      = $Employee.LockedOut
            LockOutTime           = $Employee.AccountLockoutTime
            AccountEnabled        = $Employee.Enabled
            AccountExpirationDate = $Employee.AccountExpirationDate
            PasswordLastSet       = $Employee.PasswordLastSet
            PasswordExpireDate    = $PasswordExpiry
            LastBadPassAttempt    = $Employee.LastBadPasswordAttempt
            DateCreated           = $employee.created  
            
    }
     
    $AccountInfo
    $AccountStatus
    
    Write-Host "All AD Descriptions that have a similar match to the entry here" -ForegroundColor Yellow



    #Snuck this in there, figured it wouldn't hurt
    Ferret-Out $Name

} 
#####***************************************************************#####

Function LKPhone-Lookup(){
   <#
   .SYNOPSIS
   #This will look up any phone number in our AD by the actual number
   
   .DESCRIPTION
   Type in a partial or full phone number - usually typing the 4 digit extension will be enough you can also search for cell phones. 
   
   .PARAMETER number
   Required parameter - $number you need to enter the number or partial number you are searching for 
   
   .EXAMPLE
        LKPhone-Lookup 5719
            DisplayName  MobilePhone OfficePhone HomePhone
            -----------  ----------- ----------- ---------
            Rott, Cassie             7012415719
   .EXAMPLE
        LKPhone-Lookup 241-5
            DisplayName            MobilePhone OfficePhone HomePhone
            -----------            ----------- ----------- ---------
            Jahner, Jesse          7017936187  7012415861
            Hermann, Dan           7017936183  7012415862
            Schmaltz, Terry        7014121534  17012415723
            Kohoutek, Levon                    7012415718
            Stewart, Matthew                   7012415721
            Hansen, Tami                       7012415724

   .NOTES
   Levon complained about wanting this particular function so this is simply to shut him up. I hope others find it useful. 
   #>
    [CmdletBinding()]
    Param(
            
            [Parameter(Mandatory=$True)]
            [string]$number
        )

    #$number = Read-Host -Prompt "Enter a partial phone number (prefer last 4 digits) "
    $number = $number -replace '[^0-9]'
    Get-AdUser -Filter * -Properties MobilePhone, HomePhone, OfficePhone, DisplayName |`
    Select-Object DisplayName, `
        @{Name = "MobilePhone";Expression = {($_.MobilePhone -replace '[^0-9]')}},`
        @{Name = "OfficePhone";Expression = {($_.OfficePhone -replace '[^0-9]')}},`
        @{Name = "HomePhone";Expression = {($_.HomePhone -replace '[^0-9]')}}|`
    
    Where-Object {($_.MobilePhone -like ("*$number*")) `
    -or ($_.OfficePhone -like ("*$number*"))`
    -or ($_.HomePhone -like ("*$number*"))}

}
New-Alias -Name Phone-Lookup LKPhone-Lookup
################Need to take the contact card and put this in to do the reverse search
#####***************************************************************#####
Function Lazy-OneDrive() {
    
<#
    .SYNOPSIS
    Are you setting up redirection? Do you need to copy files from a user's local profile to their OneDrive - Cass County folder? Tired of doing file copy the manual way? Do I ever have the script for you...

    .DESCRIPTION
    This will copy files from the individual's local profile to their OneDrive folder after you set up their file redirection. Couple of notes: If they have a home drive on c9svr15 you can also copy that it will prompt you. After the copy if you want it to delete the old shiz it will ask you. 

    .PARAMETER EnterSubject
    Mandatory - enter the computer number we are performing the actions on.

    .EXAMPLE
    Lazy-OneDrive C1011726

    Transcript started, output file is \\c9svr119v\sandbox$\FileBackup\Logs\LazyOneDrive\c1011724-LazyOD_2018.12.26-08.34.log
        User profiles on c1011724:
        0: servicedesk
        1: RottC
        q: Quit
        Select a number move local files to OneDrive or 'q' to quit: 0
        You are potentially ruining the life of --------> servicedesk on Computer Number c1011724
        servicedesk
        Does this user have a Home Drive for their documents? [y/n]: n

        \\c1011724\c$\users\servicedesk
        \\c1011724\c$\users\servicedesk\OneDrive - Cass County
        Are the source and the destination directories listed above correct and do you want to copy files to OneDrive [y/n]: y

        ==========
        Copy Started. This won't hurt too much its the second part that will be painful.

        ==========
        ** You will see this as its copying files this is how it will look in the logs as well.
            VERBOSE: Performing the operation "Copy Directory" on target "Item: \\c1011724\c$\users\servicedesk\Documents\My Music
            Destination: \\c1011724\c$\users\servicedesk\OneDrive - Cass County\Documents".
            VERBOSE: Performing the operation "Create Directory" on target "Destination: \\c1011724\c$\users\servicedesk\OneDrive -
            Cass County\Documents".

        **Denial like this happens when there isn't any files to copy**
                Copy-Item : Access to the path '\\c1011724\c$\users\servicedesk\Documents\My Music' is denied.
                At \\c9svr119v\sandbox$\Scripts\Profile\profile.ps1:1407 char:29
                + ...             Copy-Item -Recurse -Filter *.* -Path $lodocs\* -Destinati ...
                +                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    + CategoryInfo          : NotSpecified: (:) [Copy-Item], UnauthorizedAccessException
                    + FullyQualifiedErrorId : System.UnauthorizedAccessException,Microsoft.PowerShell.Commands.CopyItemCommand

        Check any errors and make sure you are ready to accept the consequences... Are you ready to delete the old and moldy [y/n]: n
        You gotta delete that shiz yo'self!

        Transcript stopped, output file is \\c9svr119v\sandbox$\FileBackup\Logs\LazyOneDrive\c1011724-LazyOD_2018.12.26-08.34.log
        Do more OneDrive shenanigans?
        [Y] Yes  [N] No  [?] Help (default is "Y"): n

#>


    [CmdletBinding()]
     Param (
         [Parameter(Mandatory=$True)]        
            #[alias("PC")]
            [string]$computer
          )
            function Start-BigBrother()
            {
                ##Where you want to save the logs to
                $logFolder = "\\c9svr119v\sandbox`$\FileBackup\Logs\LazyOneDrive\"


                #Function Name/Descipt of function 
                $funcdescript = "LazyOD"
        
                #change computer for whatever you may have for mandatory parameters or other distinguishable feature
                $NamedTranscript = "$computer-" + $funcdescript
                
                $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
                $ILogName = $NamedTranscript + "_" + $IDate + ".log"
                $ILog = $LogFolder + $ILogName
     
                #New-Item $LogFolder -ItemType Directory -ErrorAction SilentlyContinue -Force
     
               Start-Transcript -Path "$ILog" -NoClobber
     
            }
        Start-BigBrother


    #Prompt for a computer to connect to  
    #Test network connection before making connection  
    If ($computer -ne $Env:Computername) {  
        If (!(Test-Connection -comp $computer -count 1 -quiet)) {  
            Write-Warning "$computer is not accessible, please try a different computer or verify it is powered on."  
            Break  
            }  
        }  
  
       #Gather all of the user profiles on computer   
        Do {      
 
            Try {  
                [array]$users = Get-WmiObject -ComputerName $computer Win32_UserProfile -filter "LocalPath Like 'C:\\Users\\%'" -ea stop  
                }  

            Catch {  
                Write-Warning "$($error[0]) "  
                Break  
                }      

        #Cache the number of users  
        $num_users = $users.count  
  
     Write-Host -ForegroundColor Green "User profiles on $($computer):"  
  

        #Begin iterating through all of the accounts to display  
        For ($i=0;$i -lt $num_users; $i++) {  
            Write-Host -ForegroundColor Green "$($i): $(($users[$i].localpath).replace('C:\Users\',''))"  
         }  
    
            Write-Host -ForegroundColor Green "q: Quit"  
    
                #Prompt for user to select a profile to remove from computer  
                Do {      
                    $account = Read-Host "Select a number move local files to OneDrive or 'q' to quit"  
        
    
                #Find out if user selected to quit, otherwise answer is an integer  
                    If ($account -NotLike "q*") {  
                        $account = $account -as [int]  
                        }  
                    }          
   
            #Ensure that the selection is a number and within the valid range  
                Until (($account -lt $num_users -AND $account -match "\d") -OR $account -Like "q*")  
    
    
        If ($account -Like "q*") {  
            Stop-Transcript
            Break  
            }  

    #Warning of impending move
    Write-Host -ForegroundColor Yellow "You are potentially ruining the life of --------> $(($users[$account].localpath).replace('C:\Users\','')) on Computer Number $computer"  
    
  
  #######################****Run OneDrive for the lazy*****##############
       #Our main user path
        $usrProfile = ($users[$account]).localpath
        
        #Set OneDrive Root
        $oneDriveRoot = "OneDrive - Cass County"
                               
        # Let's cut it up - 2 examples of cutting up a string to use in the future
        $nottheactualwhatever = $usrprofile.Split("\")[2]  #because there's three things, the C, the Users Folder, and the User....
        #$nottheactualwhatever = (($users[$account].localpath).replace('C:\Users\',''))  # More resiliant to goofy shit
            #Write-Host $nottheactualwhatever        
            
            
            #The path we are going to use to run our copy and delete
                $actualuserpath = "\\$computer\c$\users\$nottheactualwhatever"
                $odactualuserpath = "\\$computer\c$\users\$nottheactualwhatever\$oneDriveRoot"
       
                #Local Folder full path
                $lodownloads = "$actualuserpath\Downloads" 
                $lopictures = "$actualuserpath\Pictures"
                $lodesktop = "$actualuserpath\Desktop"
                $lofav = "$actualuserpath\Favorites"
                $lomus = "$actualuserpath\Music"
                $lovid = "$actualuserpath\Videos"
                $locont = "$actualuserpath\Contacts"
                $lolink = "$actualuserpath\Links"
                $lodocs = "$actualuserpath\Documents"
              
                # One Drive Full paths:
                $odDownloads = "$odactualuserpath\Downloads"
                #$odPictures = "$odactualuserpath\Pictures"
                #$odDesktop = "$odactualuserpath\Desktop"
                $odFav = "$odactualuserpath\Favorites"
                $odMus = "$odactualuserpath\Music"
                $odvid = "$odactualuserpath\Videos"
                $odCont = "$odactualuserpath\Contacts"
                $odLink = "$odactualuserpath\Links"
                #$odDocs = "$odactualuserpath\Documents"

      
          Write-Host $nottheactualwhatever

#######################################################################
       
   $yesNoVariablehome = read-host "Does this user have a Home Drive for their documents? [y/n]"
       
        #Home Drive y/n and move     
        if ($yesNoVariablehome -eq "y") 
             {
                #Ask what dept 
                $deptentry = Read-Host "What 3-digit dept are they in?" 
                $basehome = "\\c9svr15\home$\"
                $backuphome = $basehome + "$deptentry\Backup"
                $homedept = $basehome + "$deptentry\" + $nottheactualwhatever
                $homedeptdocroot = "$homedept\Documents"

                #smash c9svr15, dept and user together 
                $homedept = $basehome + "$deptentry\" + $nottheactualwhatever

                Write-Host "Local Path: $actualuserpath" -ForegroundColor DarkMagenta
                Write-Host "Home Drive Path: $homedept" -ForegroundColor DarkMagenta

                $homedloads = "$homedeptdocroot\Downloads"
                $homepics  = "$homedeptdocroot\My Pictures"
                $homedesk = "$homedeptdocroot\Desktop"
                $homefav = "$homedeptdocroot\Favorites" 
                $homemus = "$homedeptdocroot\My Music" 
                $homevid = "$homedeptdocroot\My Videos" 
                $homecontact = "$homedeptdocroot\Contacts"
                $homelink = "$homedeptdocroot\Links"
                $homedocs = "$homedept"

                

<# Map the Drive - Not needed if the person running thes script has access to the share

    $Credentials = Get-Credential
            New-PSDrive -Name M -PSProvider FileSystem -Root $homedept -Persist  -Credential $Credentials

            $RUthere = Get-PSDrive Q
            $Exists = Test-Path $RUthere
            
            If ($Exists -eq $False) {
                   Try {

                         Write-Host -BackgroundColor Cyan  -ForegroundColor Black "`n " 
                         Copy-Item -Recurse -Filter *.* -Path $homedept\* -Destination $odactualuserpath -Force -Verbose

                         Write-Host -BackgroundColor Green -ForegroundColor Black "`n `a Everything is good? `n"


                    }
                    Catch {
                         Write-Warning "$($Error[0])"
                         Write-Host -BackgroundColor Yellow -ForegroundColor Black "`n If you see any red - get a screenshot! You have 45 seconds to do it"
                    }
#>
               #Ask user if they want to delete the homedrive

               $yesNoVariabledelete = read-host "Do you want to move their home drive to their local C: Drive [y/n]"

                If($yesNoVariabledelete -eq "y") {

                    Write-Host "Local Path: $actualuserpath" -ForegroundColor DarkMagenta
                    Write-Host "Home Drive Path: $homedept" -ForegroundColor DarkMagenta
    

                    Write-Host -BackgroundColor Cyan -ForegroundColor White " You asked for it... Literally " 
                    Write-Host "Creating Backup in Backup Folder" -BackgroundColor Yellow

                    ##Copy Item from HomeDrive to a Backup--- need to create PS drive here to connect and do the copy
                    Copy-Item -Recurse -Path $homedept -Destination $backuphome -Force -Verbose   
               
                    Write-Host "Moving all of their home drive to the C Drive now" -BackgroundColor Magenta           
                    ##Move Everything to their C Drive
                    ##MOVE all files to C:/Drive 

                    #$lodocs
                    #Test-Path $lodocs
                    #$lodesktop
                    #Test-Path $lodesktop
                   # $homedloads
                   # Test-Path $homedloads
                   # $homevid
                   # Test-Path $homevid
                   # $homedocs
                   # Test-Path $homedocs
                       
                    #Get-ChildItem -Path $homedloads -Filter *.* -Recurse -Verbose | Move-Item -Destination $lodownloads
                               #Remove-Item -LiteralPath $homedloads -Recurse -Verbose
               
                               Get-ChildItem -Path $homepics -Filter *.* -Recurse -Verbose | Move-Item -Destination $lopictures -Force
                               Remove-Item -LiteralPath $homepics -Recurse -Verbose -Force
               
                               Get-ChildItem -Path $homedesk -Filter *.* -Recurse -Verbose | Move-Item -Destination $lodesktop -Force
                               Remove-Item -LiteralPath $homedesk -Recurse -Verbose -Force
               
                              # Get-ChildItem -Path $homefav -Filter *.* -Recurse -Verbose | Move-Item -Destination $lofav
                               #Remove-Item -LiteralPath $homefav -Recurse -Verbose
               
                               Get-ChildItem -Path $homemus -Filter *.* -Recurse -Verbose | Move-Item -Destination $lomus -Force
                               Remove-Item -LiteralPath $homemus -Recurse -Verbose -Force
               
                               Get-ChildItem -Path $homevid -Filter *.* -Recurse -Verbose | Move-Item -Destination $lovid -Force
                               Remove-Item -LiteralPath $homevid -Recurse -Verbose -Force
                               
                              # Get-ChildItem -Path $homecontact -Filter *.* -Recurse -Verbose | Move-Item -Destination $locont
                               #Remove-Item -LiteralPath $homecontact -Recurse -Verbose
                               
                              # Get-ChildItem -Path $homelink -Filter *.* -Recurse -Verbose | Move-Item -Destination $lolink
                               #Remove-Item -LiteralPath $homelink -Recurse -Verbose
                               
                               Get-ChildItem -Path $homedocs\ -Filter *.* -Recurse -Verbose | Move-Item -Destination $lodocs -Force
                               
                               Remove-Item -LiteralPath $homedocs -Recurse -Verbose -Force

                               #$namename = $nottheactualwhatever + "-old"
                               #Rename-Item -LiteralPath $homedocs -NewName $namename -Verbose -Force
                               #Start-Sleep 120

                    }
             
             #Get-PSDrive M | Remove-PSDrive

             } 

 #*In Progress*# 

            # }

            elseif ($yesNoVariablehome -eq "n") 
            {
                Write-Host "No Home Drive. Continuing with copy of C:/User/$(($users[$account].localpath).replace('C:\Users\',''))" -ForegroundColor Cyan
            }

                
#######################################################################

            Write-Host "Testing to see if the OneDrive User folder EXISTS" -ForegroundColor Cyan
            $Existance = Test-Path $odactualuserpath

            Write-Host "One Drive Path Exists--> $Existance" -ForegroundColor Yellow
            #$Existance

            If($Existance-eq $False)
            {
                Write-Host "They do not have a OneDrive folder set up yet - do not pass go." -ForegroundColor Red
                Write-Host "Exiting Script" -ForegroundColor Red
                Return

            }

#######################################################################

            Write-host "`n"
            Write-Host $actualuserpath
            Write-Host $odactualuserpath

       $yesNoVariable = read-host "Are the source and the destination directories listed above correct and do you want to copy files to OneDrive [y/n]"

       
            # Start the copy.
                if ($yesNoVariable -eq "y") 
                {
                    write-host " " 
                    write-host "==========" 
                    write-host "Copy Started. This won't hurt too much its the second part that will be painful."
                    write-host " " 
                    write-host "==========" 
 
                            Write-Host "She said yes!"
                            Copy-Item -Recurse -Filter *.* -Path $lodownloads\* -Destination $odDownloads -Force -Verbose
                            #Copy-Item -Recurse -Filter *.* -Path $lopictures\* -Destination $odPictures -Force -Verbose
                            #Copy-Item -Recurse -Filter *.* -Path $lodesktop\* -Destination $odDesktop -Force -Verbose
                            Copy-Item -Recurse -Filter *.* -Path $lofav\* -Destination $odFav -Force -Verbose
                            Copy-Item -Recurse -Filter *.* -Path $lomus\* -Destination $odMus -Force -Verbose
                            Copy-Item -Recurse -Filter *.* -Path $lovid\* -Destination $odvid -Force -Verbose
                            Copy-Item -Recurse -Filter *.* -Path $locont\* -Destination $odCont -Force -Verbose
                            Copy-Item -Recurse -Filter *.* -Path $lolink\* -Destination $odLink -Force -Verbose
                            #Copy-Item -Recurse -Filter *.* -Path $lodocs\* -Destination $odDocs -Force -Verbose
         
                        }   
                elseif ($yesNoVariable -eq "n")
                    {
                    Write-Host "She said NO! If only he had taken her advise more frequently."
                    Write-host "Wrong Answer..." -ForegroundColor DarkRed -BackgroundColor Red
                    stop-transcript
                    Break
                    }
                        
                            
            $yesNoVariable = read-host "Check any errors and make sure you are ready to accept the consequences... Are you ready to delete the old and moldy [y/n]"
                    if ($yesNoVariable -eq "y") {

                        write-host " " 
                        write-host "==========" 
                        write-host "Removal Started. If you didn't pay attention or double check this is gonna hurt."
                        write-host " " 
                        write-host "==========" 
    
                            Remove-Item -Recurse -Path $lodownloads\ -Force -Verbose
                            #Remove-Item -Recurse -Path $lopictures\ -Force -Verbose
                            Remove-Item -Recurse -Path $lomus\ -Force -Verbose
                            Remove-Item -Recurse -Path $lovid\ -Force -Verbose
                            Remove-Item -Recurse -Path $locont\ -Force -Verbose
                            Remove-Item -Recurse -Path $lolink\ -Force -Verbose
                            #Remove-Item -Recurse -Path $lodocs\ -Force -Verbose

                            #Remove-Item -Recurse -Path $lodesktop\ -Force -Verbose
                            Remove-Item -Recurse -Path $lofav\ -Force -Verbose
                           

                        }
                       
                    elseif ($yesNoVariable -eq "n")
                    {
                        Write-host "You gotta delete that shiz yo'self!" -ForegroundColor DarkRed -BackgroundColor Red
                    }
                         
                           
                        
    stop-transcript

    #Configure yes choice  
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","OneDrive another profile."  
  
    #Configure no choice  
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Quit profile removal"  
  
    #Determine Values for Choice  
    $choice = [System.Management.Automation.Host.ChoiceDescription[]] @($yes,$no)  
  
    #Determine Default Selection  
    [int]$default = 0  
  
    #Present choice option to user  
    $userchoice = $host.ui.PromptforChoice("","Do more OneDrive shenanigans?",$choice,$default)  
    }  

#If user selects No, then quit the script      
Until ($userchoice -eq 1)
}






#####***************************************************************#####


Function Copy-Sloth() {

<#
.SYNOPSIS
Copy files from local PC to Sandbox/FileBackup

.DESCRIPTION
Enter a computer number and follow the prompts to copy local files to Sandbox\FileBackup - A log folder is created at Sandbox\Filebackup\Logs this will show every file that was copied and any potential errors. 
This will pull all the profiles on the device and ask you to select the one you want to make copies from. You will then be prompted to name 

.PARAMETER computer
The number of the computer you wish to copy the files from. 

.EXAMPLE
Copy-Sloth C1011726

Transcript started, output file is \\c9svr119v\sandbox$\FileBackup\Logs\LazyFileCopy-Sloth\C1010021-
LazyCopySloth_2018.12.10-09.23.log
User profiles on C1010021:
 
 
0: servicedesk
1: Administrator.CASSCOUNTY
2: LKohoutek
3: JHeising
4: jorgensond
5: Administrator
q: Quit
Select a number to delete local profile or 'q' to quit: 4
This is who you are straight jacking files from --------> jorgensond on Computer Number C1010021
 
 
Put in the name of the Folder are we saving to?: jorgensond
 
 
\\C1010021\c$\users\jorgensond
\\c9svr119v\sandbox$\FileBackup\jorgensond
 
 


    Directory: \\c9svr119v\sandbox$\FileBackup


Mode                LastWriteTime         Length Name                                              
----                -------------         ------ ----                                              
d-----       12/10/2018   9:24 AM                jorgensond                                        
Is this where you want to copy to??? [y/n]: y
 
=====================================================
Copy Started.
From \\C1010021\c$\users\jorgensond 
To \\c9svr119v\sandbox$\FileBackup\jorgensond 
=====================================================
She said yes!

VERBOSE: Performing the operation "Copy File" on target "Item: \\C1010265\c$\users\mutalipassis\Links\R
ecentPlaces.lnk Destination: \\c9svr119v\sandbox$\FileBackup\Mutalipassis\Links\RecentPlaces.lnk".
VERBOSE: Performing the operation "Copy File" on target "Item: \\C1010265\c$\users\mutalipassis\Links\S
harepoint Sites.lnk Destination: \\c9svr119v\sandbox$\FileBackup\Mutalipassis\Links\Sharepoint Sites.ln
k".
VERBOSE: Performing the operation "Copy File" on target "Item: \\C1010265\c$\users\mutalipassis\Links\_
FileNet Ready to Upload.lnk Destination: \\c9svr119v\sandbox$\FileBackup\Mutalipassis\Links\_FileNet Re
ady to Upload.lnk".

## This error is is here because there is nothing in the Music folder 
Copy-Item : Cannot find path '\\C1010265\c$\users\mutalipassis\Music' because it does not exist.
At C:\Users\rottc\OneDrive - Cass County\Desktop\GIT Stuff\IT Profiles-Modules\SRC\Function 
LazyFile-Copy.ps1:155 char:33
+ ...             Copy-Item -Recurse -Filter * -Path $lomus -Destination $s ...
+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (\\C1010265\c$\users\mutalipassis\Music:String) [Copy-I 
   tem], ItemNotFoundException
    + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.CopyItemCommand
 



Transcript stopped, output file is \\c9svr119v\sandbox$\FileBackup\Logs\LazyFileCopy-Sloth\C1010265-Laz
yCopySloth_2018.12.10-11.14.log



#>
    [CmdletBinding()]
     Param(
          [Parameter(Mandatory=$True)]        
            [alias("PC")]
            $computer
    )


        function Start-BigBrother()
        {
            ##Where you want to save the logs to
            $logFolder = "\\c9svr119v\sandbox`$\FileBackup\Logs\LazyFileCopy-Sloth\"


            #Function Name/Descipt of function 
            $funcdescript = "LazyCopySloth"
        
            #change computer for whatever you may have for mandatory parameters or other distinguishable feature
            $NamedTranscript = "$computer-" + $funcdescript
                
            $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
            $ILogName = $NamedTranscript + "_" + $IDate + ".log"
            $ILog = $LogFolder + $ILogName
     
            #New-Item $LogFolder -ItemType Directory -ErrorAction SilentlyContinue -Force
     
                Start-Transcript -Path "$ILog" #-NoClobber
     
        }
     Start-BigBrother   

    
  
#Prompt for a computer to connect to  
#Test network connection before making connection  
    If ($computer -ne $Env:Computername) {  
        If (!(Test-Connection -comp $computer -count 1 -quiet)) {  
            Write-Warning "$computer is not accessible, please try a different computer or verify it is powered on."  
            Break  
            }  
        }  
            Do {      
            #Gather all of the user profiles on computer  
                Try {  
                    [array]$users = Get-WmiObject -ComputerName $computer Win32_UserProfile -filter "LocalPath Like 'C:\\Users\\%'" -ea stop  
                    }  
                Catch {  
                    Write-Warning "$($error[0]) "  
                    Break  
                    }      
       
            #Cache the number of users  
            $num_users = $users.count  
  
            Write-Host -ForegroundColor Green "User profiles on $($computer):"  
            Write-Host " " 
            Write-Host " " 
  
                #Begin iterating through all of the accounts to display  
                For ($i=0;$i -lt $num_users; $i++) {  
                    Write-Host -ForegroundColor Green "$($i): $(($users[$i].localpath).replace('C:\Users\',''))"  
                    }  
                Write-Host -ForegroundColor Green "q: Quit"  
           
                #Prompt for user to select a profile to copy from computer  
                    Do {      
                        $account = Read-Host "Select a number to copy local files or 'q' to quit"  
                       
                        #Find out if user selected to quit, otherwise answer is an integer  
                        If ($account -NotLike "q*") {  
                            $account = $account -as [int]  
                            }  
                    }          
            
                    #Ensure that the selection is a number and within the valid range  
                    Until (($account -lt $num_users -AND $account -match "\d") -OR $account -Like "q*")  
                        If ($account -Like "q*") {  
                            Stop-Transcript
                            Break  
                            }  

                Write-Host -ForegroundColor Yellow "This is who you are straight jacking files from --------> $(($users[$account].localpath).replace('C:\Users\','')) on Computer Number $computer"  
                Write-Host " " 
                Write-Host " " 
    #**************************************************#Run OneDrive for the lazy 

        #Our main user path
        $usrProfile = ($users[$account]).localpath
       
        $nottheactualwhatever = $usrprofile.Split("\")[2]  #because there's three things, the C, the Users Folder, and the User....
 #Write-Host $nottheactualwhatever
 #Break
        #Variables for locations of files
        $oneDriveRoot = "OneDrive - Cass County"
        $SandboxDestination = $nottheactualwhatever
        Write-Host " " 
        Write-Host " " 
    
        #The path we are going to use to run our copy
                $actualuserpath = "\\$computer\c$\users\$nottheactualwhatever"
                $sdbxactualuserpath = "\\c9svr119v\sandbox`$\FileBackup\$sandboxdestination"
               
                Write-Host $actualuserpath
                Write-Host $sdbxactualuserpath
                Write-Host " " 
                Write-Host " " 
               
                ##Need If statement to test if the folder has been created on Sandbox and if it hasn't to create it
                If ($sdbxactualuserpath -ne $true) {
                    New-Item -Path $sdbxactualuserpath -ItemType Directory -Force
                }


                #Local Folder full path
                $lodownloads = "$actualuserpath\Downloads" 
                $lopictures = "$actualuserpath\Pictures"
                $lodesktop = "$actualuserpath\Desktop"
                $lofav = "$actualuserpath\Favorites"
                $lomus = "$actualuserpath\Music"
                $lovid = "$actualuserpath\Videos"
                $locont = "$actualuserpath\Contacts"
                $lolink = "$actualuserpath\Links"
                $lodocs = "$actualuserpath\Documents"
                $lotuspath = "\\$computer\c$\Program Files (x86)\IBM\Lotus\Notes\Data"
                $stickynote = "$actualuserpath\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState"
                $TracsUserPath = "\\$computer\c$\ProgramData\TraCs\Settings"

       $yesNoVariable = read-host "Is this where you want to copy to??? [y/n]"

        # Start the copy.
            if ($yesNoVariable -eq "y") 
            {
                    write-host " " 
                    write-host "=====================================================" 
                    write-host "Copy Started." -ForegroundColor Green
                    write-host "From $actualuserpath " -ForegroundColor Red
                    write-host "To $sdbxactualuserpath " -ForegroundColor Red
                    write-host "=====================================================" 
 
                            Write-Host "She said yes!"
                            Copy-Item -Recurse -Filter * -Path $lodownloads -Destination $sdbxactualuserpath -Force -Verbose
                            Copy-Item -Recurse -Filter * -Path $lopictures -Destination $sdbxactualuserpath -Force -Verbose
                            Copy-Item -Recurse -Filter * -Path $lodesktop -Destination $sdbxactualuserpath -Force -Verbose
                            Copy-Item -Recurse -Filter * -Path $lofav -Destination $sdbxactualuserpath -Force -Verbose
                            Copy-Item -Recurse -Filter * -Path $lodocs -Destination $sdbxactualuserpath -Force -Verbose

                            #Get-ChildItem -Path $lodesktop\* | Copy-Item -Recurse -Filter * -Destination $sdbxactualuserpath -Force -Verbose
                            #Get-ChildItem -Path $lofav\* | Copy-Item -Recurse -Filter * -Destination $sdbxactualuserpath -Force -Verbose
                                
                            Copy-Item -Recurse -Filter * -Path $lovid -Destination $sdbxactualuserpath -Force -Verbose
                            Copy-Item -Recurse -Filter * -Path $locont -Destination $sdbxactualuserpath -Force -Verbose
                            Copy-Item -Recurse -Filter * -Path $lolink -Destination $sdbxactualuserpath -Force -Verbose
                             
                            Copy-Item -Recurse -Filter * -Path $lomus -Destination $sdbxactualuserpath -Force -Verbose

              #Copy Sticky Notes
                            Copy-Item -Recurse -Filter * -Path $stickynote\plum.sqlite -Destination $sdbxactualuserpath -Force -Verbose


              #Copy Lotus Notes Folder 
                        $LotusExists = Test-Path $lotuspath
                                                
                        If ($LotusExists -eq $True) {
                                New-Item -Path $sdbxactualuserpath\Lotus -ItemType Directory
                                Copy-Item -Recurse -Filter * -Path $lotuspath\* -Destination $sdbxactualuserpath\Lotus -Force -Verbose
                        }
         

              ##Copy TraCs AutoNumber.ini and MachineID.ini    
                    $Tracsexists = Test-Path $TracsUserPath

                    if ($Tracsexists -eq $True) {
                        New-Item -Path $sdbxactualuserpath\Tracs -ItemType Directory
                        Copy-Item -Recurse -Filter * -Path $TracsUserPath\AutoNumber.ini -Destination $sdbxactualuserpath\TraCS -Force -Verbose
                        Copy-Item -Recurse -Filter * -Path $TracsUserPath\MachineID.ini -Destination $sdbxactualuserpath\TraCS -Force -Verbose

                    }                
                }   

            elseif ($yesNoVariable -eq "n")
                {
                Write-Host "She said NO! If only he had taken her advise more frequently."
                Write-host "You said NO--------> Wrong Answer..." -ForegroundColor DarkRed -BackgroundColor Red
                }
                                                  
                        
   

    #Configure yes choice  
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","OneDrive another profile."  
  
    #Configure no choice  
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Quit profile removal"  
  
    #Determine Values for Choice  
    $choice = [System.Management.Automation.Host.ChoiceDescription[]] @($yes,$no)  
  
    #Determine Default Selection  
    [int]$default = 0  
  
    #Present choice option to user  
    $userchoice = $host.ui.PromptforChoice("","Do more file copy shenanigans?",$choice,$default)  
    }  

#If user selects No, then quit the script      
    Until ($userchoice -eq 1)

    Stop-Transcript
}

New-Alias -Name CopyTo-Sandbox Copy-Sloth

######Ask if they want to copy to a new PC right away and then launch the copy goonies
#####***************************************************************#####


Function Copy-SlothPatrol() {

<#
.SYNOPSIS
Copy files from local PC to Sandbox/FileBackup

.DESCRIPTION
Enter a computer number and follow the prompts to copy local files to Sandbox\FileBackup - A log folder is created at Sandbox\Filebackup\Logs this will show every file that was copied and any potential errors. 
This will pull all the profiles on the device and ask you to select the one you want to make copies from. Follow the prompts to success - This will also back up the machineid.ini and autonumber.ini!!!!

.PARAMETER computer
The number of the computer you wish to copy the files from. 

.EXAMPLE
Copy-Sloth C1011726

Transcript started, output file is \\c9svr119v\sandbox$\FileBackup\Logs\LazyFileCopy-Sloth\C1010021-
LazyCopySloth_2018.12.10-09.23.log
User profiles on C1010021:
 
 
0: servicedesk
1: Administrator.CASSCOUNTY
2: LKohoutek
3: JHeising
4: jorgensond
5: Administrator
q: Quit
Select a number to delete local profile or 'q' to quit: 4
This is who you are straight jacking files from --------> jorgensond on Computer Number C1010021
 
 
Put in the name of the Folder are we saving to?: jorgensond
 
 
\\C1010021\c$\users\jorgensond
\\c9svr119v\sandbox$\FileBackup\jorgensond
 
 


    Directory: \\c9svr119v\sandbox$\FileBackup


Mode                LastWriteTime         Length Name                                              
----                -------------         ------ ----                                              
d-----       12/10/2018   9:24 AM                jorgensond                                        
Is this where you want to copy to??? [y/n]: y
 
=====================================================
Copy Started.
From \\C1010021\c$\users\jorgensond 
To \\c9svr119v\sandbox$\FileBackup\jorgensond 
=====================================================
She said yes!

VERBOSE: Performing the operation "Copy File" on target "Item: \\C1010265\c$\users\mutalipassis\Links\R
ecentPlaces.lnk Destination: \\c9svr119v\sandbox$\FileBackup\Mutalipassis\Links\RecentPlaces.lnk".
VERBOSE: Performing the operation "Copy File" on target "Item: \\C1010265\c$\users\mutalipassis\Links\S
harepoint Sites.lnk Destination: \\c9svr119v\sandbox$\FileBackup\Mutalipassis\Links\Sharepoint Sites.ln
k".
VERBOSE: Performing the operation "Copy File" on target "Item: \\C1010265\c$\users\mutalipassis\Links\_
FileNet Ready to Upload.lnk Destination: \\c9svr119v\sandbox$\FileBackup\Mutalipassis\Links\_FileNet Re
ady to Upload.lnk".

## This error is is here because there is nothing in the Music folder 
Copy-Item : Cannot find path '\\C1010265\c$\users\mutalipassis\Music' because it does not exist.
At C:\Users\rottc\OneDrive - Cass County\Desktop\GIT Stuff\IT Profiles-Modules\SRC\Function 
LazyFile-Copy.ps1:155 char:33
+ ...             Copy-Item -Recurse -Filter * -Path $lomus -Destination $s ...
+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: (\\C1010265\c$\users\mutalipassis\Music:String) [Copy-I 
   tem], ItemNotFoundException
    + FullyQualifiedErrorId : PathNotFound,Microsoft.PowerShell.Commands.CopyItemCommand
 



Transcript stopped, output file is \\c9svr119v\sandbox$\FileBackup\Logs\LazyFileCopy-Sloth\C1010265-Laz
yCopySloth_2018.12.10-11.14.log



#>
    [CmdletBinding()]
     Param(
          [Parameter(Mandatory=$True)]        
            [alias("PC")]
            $computer
    )


        function Start-BigBrother()
        {
            ##Where you want to save the logs to
            $logFolder = "\\c9svr119v\sandbox`$\FileBackup\Logs\LazyFileCopy-Sloth\"


            #Function Name/Descipt of function 
            $funcdescript = "LazyCopySloth"
        
            #change computer for whatever you may have for mandatory parameters or other distinguishable feature
            $NamedTranscript = "$computer-" + $funcdescript
                
            $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
            $ILogName = $NamedTranscript + "_" + $IDate + ".log"
            $ILog = $LogFolder + $ILogName
     
            #New-Item $LogFolder -ItemType Directory -ErrorAction SilentlyContinue -Force
     
                Start-Transcript -Path "$ILog" #-NoClobber
     
        }
     Start-BigBrother   

    
  
#Prompt for a computer to connect to  
#Test network connection before making connection  
    If ($computer -ne $Env:Computername) {  
        If (!(Test-Connection -comp $computer -count 1 -quiet)) {  
            Write-Warning "$computer is not accessible, please try a different computer or verify it is powered on."  
            Break  
            }  
        }  
            Do {      
            #Gather all of the user profiles on computer  
                Try {  
                    [array]$users = Get-WmiObject -ComputerName $computer Win32_UserProfile -filter "LocalPath Like 'C:\\Users\\%'" -ea stop  
                    }  
                Catch {  
                    Write-Warning "$($error[0]) "  
                    Break  
                    }      
       
            #Cache the number of users  
            $num_users = $users.count  
  
            Write-Host -ForegroundColor Green "User profiles on $($computer):"  
            Write-Host " " 
            Write-Host " " 
  
                #Begin iterating through all of the accounts to display  
                For ($i=0;$i -lt $num_users; $i++) {  
                    Write-Host -ForegroundColor Green "$($i): $(($users[$i].localpath).replace('C:\Users\',''))"  
                    }  
                Write-Host -ForegroundColor Green "q: Quit"  
           
                #Prompt for user to select a profile to copy from computer  
                    Do {      
                        $account = Read-Host "Select a number to copy local files or 'q' to quit"  
                       
                        #Find out if user selected to quit, otherwise answer is an integer  
                        If ($account -NotLike "q*") {  
                            $account = $account -as [int]  
                            }  
                    }          
            
                    #Ensure that the selection is a number and within the valid range  
                    Until (($account -lt $num_users -AND $account -match "\d") -OR $account -Like "q*")  
                        If ($account -Like "q*") {  
                            Stop-Transcript
                            Break  
                            }  

                Write-Host -ForegroundColor Yellow "This is who you are straight jacking files from --------> $(($users[$account].localpath).replace('C:\Users\','')) on Computer Number $computer"  
                Write-Host " " 
                Write-Host " " 
    #**************************************************#Run OneDrive for the lazy 

        #Our main user path
        $usrProfile = ($users[$account]).localpath
       
        $nottheactualwhatever = $usrprofile.Split("\")[2]  #because there's three things, the C, the Users Folder, and the User....
        #Write-Host $nottheactualwhatever
 #Break
 
 
        #Variables for locations of files
        $oneDriveRoot = "OneDrive - Cass County"
        $SandboxDestination = $nottheactualwhatever
        Write-Host " " 
        Write-Host " " 
    
        #The path we are going to use to run our copy
                $actualuserpath = "\\$computer\c$\users\$nottheactualwhatever"
                $sdbxactualuserpath = "\\c9svr119v\sandbox`$\FileBackup\$sandboxdestination"
                
               
                Write-Host $actualuserpath
                Write-Host $sdbxactualuserpath
                Write-Host " " 
                Write-Host " " 
               
                ##Need If statement to test if the folder has been created on Sandbox and if it hasn't to create it
                If ($sdbxactualuserpath -ne $true) {
                    New-Item -Path $sdbxactualuserpath -ItemType Directory -Force

                }


                #Local Folder full path
                $lodownloads = "$actualuserpath\Downloads" 
                $lopictures = "$actualuserpath\Pictures"
                $lodesktop = "$actualuserpath\Desktop"
                $lofav = "$actualuserpath\Favorites"
                $lomus = "$actualuserpath\Music"
                $lovid = "$actualuserpath\Videos"
                $locont = "$actualuserpath\Contacts"
                $lolink = "$actualuserpath\Links"
                $lodocs = "$actualuserpath\Documents"
                $lotuspath = "\\$computer\c$\Program Files (x86)\IBM\Lotus\Notes\Data"
                $stickynote = "$actualuserpath\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState"
                $TracsUserPath = "\\$computer\c$\ProgramData\TraCs\Settings"
                
              

       $yesNoVariable = read-host "Is this where you want to copy to??? [y/n]"

      # Start the copy.
              if ($yesNoVariable -eq "y") 
                {
                    write-host " " 
                    write-host "=====================================================" 
                    write-host "Copy Started." -ForegroundColor Green
                    write-host "From $actualuserpath " -ForegroundColor Red
                    write-host "To $sdbxactualuserpath " -ForegroundColor Red
                    write-host "=====================================================" 
 
                        Write-Host "She said yes!"
                        Copy-Item -Recurse -Filter * -Path $lodownloads -Destination $sdbxactualuserpath -Force -Verbose
                        Copy-Item -Recurse -Filter * -Path $lopictures -Destination $sdbxactualuserpath -Force -Verbose
                        Copy-Item -Recurse -Filter * -Path $lodesktop -Destination $sdbxactualuserpath -Force -Verbose
                        Copy-Item -Recurse -Filter * -Path $lofav -Destination $sdbxactualuserpath -Force -Verbose
                        Copy-Item -Recurse -Filter * -Path $lodocs -Destination $sdbxactualuserpath -Force -Verbose
                                
                        Copy-Item -Recurse -Filter * -Path $lovid -Destination $sdbxactualuserpath -Force -Verbose
                        Copy-Item -Recurse -Filter * -Path $locont -Destination $sdbxactualuserpath -Force -Verbose
                        Copy-Item -Recurse -Filter * -Path $lolink -Destination $sdbxactualuserpath -Force -Verbose
                                
                        Copy-Item -Recurse -Filter * -Path $stickynote\plum.sqlite -Destination $sdbxactualuserpath -Force -Verbose


                        Copy-Item -Recurse -Filter * -Path $lomus -Destination $sdbxactualuserpath -Force -Verbose

              #Copy Lotus Notes Folder 
                        $LotusExists = Test-Path $lotuspath
                                                
                        If ($LotusExists -eq $True) {
                                New-Item -Path $sdbxactualuserpath\Lotus -ItemType Directory
                                Copy-Item -Recurse -Filter * -Path $lotuspath\* -Destination $sdbxactualuserpath\Lotus -Force -Verbose
                        }


              ##Copy TraCs AutoNumber.ini and MachineID.ini    
                        $Tracsexists = Test-Path $TracsUserPath

                        if ($Tracsexists -eq $True) {
                            New-Item -Path $sdbxactualuserpath\Tracs -ItemType Directory
                            Copy-Item -Recurse -Filter * -Path $TracsUserPath\AutoNumber.ini -Destination $sdbxactualuserpath\TraCS -Force -Verbose
                            Copy-Item -Recurse -Filter * -Path $TracsUserPath\MachineID.ini -Destination $sdbxactualuserpath\TraCS -Force -Verbose

                        }
         


                    }   
               
                elseif ($yesNoVariable -eq "n")
                    {
                        Write-Host "She said NO! If only he had taken her advise more frequently."
                        Write-host "You said NO--------> Wrong Answer..." -ForegroundColor DarkRed -BackgroundColor Red
                    }
                                                  
                        
   

    #Configure yes choice  
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","OneDrive another profile."  
  
    #Configure no choice  
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Quit profile removal"  
  
    #Determine Values for Choice  
    $choice = [System.Management.Automation.Host.ChoiceDescription[]] @($yes,$no)  
  
    #Determine Default Selection  
    [int]$default = 0  
  
    #Present choice option to user  
    $userchoice = $host.ui.PromptforChoice("","Do more file copy shenanigans?",$choice,$default)  
    }  

#If user selects No, then quit the script      
    Until ($userchoice -eq 1)

    Stop-Transcript
}


######Ask if they want to copy to a new PC right away and then launch the copy goonies
#####***************************************************************#####
Function Copy-Goonies() {
 
         <#
        .SYNOPSIS
        Copy files from Sandbox/FileBackup to local pc.

        .DESCRIPTION
        Enter a computer number and this will prompt you for some information and then copy information from a backup folder on Sandbox to a local computer and profile of your choice. 

        .PARAMETER computer
        The number of the computer you wish to copy the files to. 

        .EXAMPLE
        Copy-Goonies C1011726
        Transcript started, output file is \\c9svr119v\sandbox$\FileBackup\Logs\LazyFileCopy-Sloth\C1010458-LazyCopySloth_2018.12.11-09.49.log
        User profiles on C1010458:
 
 
        0: Administrator
        1: servicedesk
        2: Servicedesk.CASSCOUNTY
        3: Administrator.CASSCOUNTY
        4: greenm
        5: mturmo
        6: LKohoutek
        7: brenners
        q: Quit
        Select a number to copy local files or 'q' to quit: 7
        This is who you are straight jacking files from --------> brenners on Computer Number C1010458
 
 
 
 
        \\C1010458\c$\users\brenners
        \\c9svr119v\sandbox$\FileBackup\brenners
 
 


            Directory: \\c9svr119v\sandbox$\FileBackup


        Mode                LastWriteTime         Length Name                              
        ----                -------------         ------ ----                              
        d-----       12/11/2018   9:49 AM                brenners                          
        Is this where you want to copy to??? [y/n]: y
 
        =====================================================
        Copy Started.
        From \\C1010458\c$\users\brenners 
        To \\c9svr119v\sandbox$\FileBackup\brenners 
        =====================================================
        VERBOSE: Performing the operation "Copy Directory" on target "Item: \\C1010458\c$\Pr
        ogram Files (x86)\IBM\Lotus\Notes\Data Destination: \\c9svr119v\sandbox$\FileBackup\brenners\lotus".
        VERBOSE: Performing the operation "Create Directory" on target "Destination: \\c9svr119v\sandbox$\FileBackup\brenners\lotus".
        VERBOSE: Performing the operation "Copy File" on target "Item: \\C1010458\c$\Program Files (x86)\IBM\Lotus\Notes\Data\brenners.id Destination: \\c9svr119v\sandbox$\FileBackup\brenners\lotus\brenners.id".
        Transcript stopped, output file is \\c9svr119v\sandbox$\FileBackup\Logs\LazyFileCopy-Sloth\C1010458-LazyCopySloth_2018.12.11-09.49.log

        #>

    [CmdletBinding()]
     Param (
         [Parameter(Mandatory=$True)]        
            
            [string]$computer
            )


            function Start-BigBrother()
            {
                ##Where you want to save the logs to
                $logFolder = "\\c9svr119v\sandbox`$\FileBackup\Logs\LazyFileCopy-Goonies\"


                #Function Name/Descipt of function 
                $funcdescript = "LazyCopyGoonies"
        
                #change computer for whatever you may have for mandatory parameters or other distinguishable feature
                $NamedTranscript = "$computer-" + $funcdescript
                
                $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
                $ILogName = $NamedTranscript + "_" + $IDate + ".log"
                $ILog = $LogFolder + $ILogName
     
                #New-Item $LogFolder -ItemType Directory -ErrorAction SilentlyContinue -Force
     
                    Start-Transcript -Path "$ILog" -NoClobber
     
            }
     Start-BigBrother   
 



 ##### Specify the folder we are copying
 $backups = @(Get-ChildItem -Path "\\c9svr119v\sandbox$\FileBackup")
 $countofback = $backups.Count
 
 #$backups
    #If the user count has more than one option - it will print out a menu and ask the user to make a choice
            if($countofback -gt 1){
                Write-Host -ForegroundColor Green "Files that are available:"  

                For ($i=0;$i -lt $countofback; $i++){
                    Write-Host -ForegroundColor Red "$($i): $(($backups[$i]))"      
                    }

                Do {
                    $selection = Read-Host "Enter the number of the user you wish to look up or put in q to quit" 
                    If ($selection -NotLike "q*"){
                        $selection = $selection -as [int]
                        $DoThisFolder = $backups[$selection]
                    }   
                }
                Until (($selection -lt $countofback -AND $selection -match "\d") -OR $selection -Like "q*")  
            }
       
        #Print to screen and stop if no users are found   
            elseif ($countofback -lt 1) {
                Write-Host "Nothing Found not found" -ForegroundColor Yellow
                break
            }
                 
        #This will do a one to one match 
        elseif ($countofback -eq 1) {
            $DoThisFolder = $AliasEmploy
           
        }

        #Stop if they hit q
            If ($selection -Like "q*") {  
                Break  
                Stop-Transcript
                }    

###Select the computer and user we are copying to
    
    #$Computer = Read-Host "What computer are you moving these files to?"
 
        #Test network connection before making connection  
                If ($computer -ne $Env:Computername) {  
                    If (!(Test-Connection -comp $computer -count 1 -quiet)) {  
                        Write-Warning "$computer is not accessible, please try a different computer or verify it is powered on."  
                        Break  
                        }  
                    }  
            Do {      
            #Gather all of the user profiles on computer  
                Try {  
                    [array]$users = Get-WmiObject -ComputerName $computer Win32_UserProfile -filter "LocalPath Like 'C:\\Users\\%'" -ea stop  
                    }  
                Catch {  
                    Write-Warning "$($error[0]) "  
                    Break  
                    Stop-Transcript
                    }      
           
        #Cache the number of users  
            $num_users = $users.count  
            
            Write-Host -ForegroundColor Green "User profiles on $($computer):"  
                Write-Host " " 
                Write-Host " " 
  
    #Begin iterating through all of the accounts to display  
            For ($i=0;$i -lt $num_users; $i++) {  
                Write-Host -ForegroundColor Green "$($i): $(($users[$i].localpath).replace('C:\Users\',''))"  
                }  
            Write-Host -ForegroundColor Green "q: Quit"  
                    Write-Host " " 
                              
            #Prompt for user to select a profile to remove from computer  
                Do {      
                    $account = Read-Host "Select a number to delete local profile or 'q' to quit"  
                    #Find out if user selected to quit, otherwise answer is an integer  
                    If ($account -NotLike "q*") {  
                        $account = $account -as [int]  
                        }  
                    }          
             #Ensure that the selection is a number and within the valid range  
                Until (($account -lt $num_users -AND $account -match "\d") -OR $account -Like "q*")  
          
            If ($account -Like "q*") {  
                Break  
                }  
            Write-Host -ForegroundColor Yellow "You are copying files to --------> $(($users[$account].localpath).replace('C:\Users\','')) on Computer Number $computer"  
            Write-Host " " 
            Write-Host " " 
  
    
    #**************************************************#Copy Pasta in action
        #Our main user path
        $usrProfile = ($users[$account]).localpath
        $nottheactualwhatever = $usrprofile.Split("\")[2]  #because there's three things, the C, the Users Folder, and the User....

        #Variables for locations of files
        $oneDriveRoot = "OneDrive - Cass County"
        $SandboxDestination = $dothisfolder


        #The path we are going to use to run our copy
                $actualuserpath = "\\$computer\c$\users\$nottheactualwhatever"
                $sdbxactualuserpath = "\\c9svr119v\sandbox`$\FileBackup\$sandboxdestination"
                $lotuspath = "\\$computer\c$\Program Files (x86)\IBM\Lotus\Notes\"
                $lotussdbx = "\\c9svr119v\sandbox`$\FileBackup\$sandboxdestination\lotus"
                $stickydbx = "\\c9svr119v\sandbox`$\FileBackup\$sandboxdestination\plum.sqlite"
                $Tracssdbx = "\\c9svr119v\sandbox`$\FileBackup\$sandboxdestination\Tracs"
          
                #Local Folder full path
                $lodownloads = "$actualuserpath\Downloads" 
                $lopictures = "$actualuserpath\Pictures"
                $lodesktop = "$actualuserpath\Desktop"
                $lofav = "$actualuserpath\Favorites"
                $lomus = "$actualuserpath\Music"
                $lovid = "$actualuserpath\Videos"
                $locont = "$actualuserpath\Contacts"
                $lolink = "$actualuserpath\Links"
                $lodocs = "$actualuserpath\Documents"
                $stickynote = "$actualuserpath\AppData\Local\Packages\Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe\LocalState"
                $TracsUserPath = "\\$computer\c$\ProgramData\TraCs\Settings"


          #Where the documents are going
           Write-Host "User File Path --> $actualuserpath"
           Write-Host "Lotus Notes Copy --> $lotuspath"
           Write-Host " "
           Write-Host " "

       $yesNoVariable = read-host "Is this where you want to copy to??? [y/n]"

                # Start the copy.
                    if ($yesNoVariable -eq "y") 
                    {
                        write-host " " 
                        write-host "=============================================================" 
                        write-host "Copy Started. This won't hurt too much." -ForegroundColor Red
                        write-host " From $sdbxactualuserpath " -ForegroundColor Yellow
                        write-host " to $actualuserpath " -ForegroundColor Green
                        write-host "=============================================================" 
 
                                #Get-ChildItem -path $sdbxactualuserpath | Copy-Item -Recurse -Filter * -Destination $actualuserpath -force

                                Copy-Item -Recurse -Filter * -Path $sdbxactualuserpath\* -Destination $actualuserpath -Force -Verbose
                                Copy-Item -Recurse -Filter * -Path $lotussdbx -Destination $lotuspath -Force -Verbose
                                Copy-Item -Recurse -Filter * -Path $stickydbx -Destination $stickynote -Force -Verbose

              #Copy Lotus Notes Folder 
                        $LotusExists = Test-Path $lotuspath
                                                
                        If ($LotusExists -eq $True) {
                            Copy-Item -Recurse -Filter * -Path $sdbxactualuserpath\Lotus -Destination $lotuspath -Force -Verbose
                        }


              ##Copy TraCs AutoNumber.ini and MachineID.ini    
                        $Tracsexists = Test-Path $TracsUserPath

                        if ($Tracsexists -eq $True) {
                           # Copy-Item -Recurse -Filter * -Path $sdbxactualuserpath\TraCS -Destination $TracsUserPath\AutoNumber.ini -Force -Verbose
                            Copy-Item -Recurse -Filter * -Path $sdbxactualuserpath\tracs\* -Destination $TracsUserPath -Force -Verbose

                        }
                                


                                #Copy-Item -Recurse -Filter * -Path $lopictures\* -Destination $sdbxactualuserpath -Force -Verbose
                                #Copy-Item -Recurse -Filter * -Path $lodesktop -Destination $sdbxactualuserpath -Force -Verbose
                                #Copy-Item -Recurse -Filter * -Path $lofav -Destination $sdbxactualuserpath -Force -Verbose
                                #Copy-Item -Recurse -Filter * -Path $lodocs -Destination $sdbxactualuserpath -Force -Verbose

                                #Get-ChildItem -Path $lodesktop\* | Copy-Item -Recurse -Filter * -Destination $sdbxactualuserpath -Force -Verbose
                                #Get-ChildItem -Path $lofav\* | Copy-Item -Recurse -Filter * -Destination $sdbxactualuserpath -Force -Verbose
                                
                                #Copy-Item -Recurse -Filter * -Path $lovid\* -Destination $sdbxactualuserpath -Force -Verbose
                                #Copy-Item -Recurse -Filter * -Path $locont\* -Destination $sdbxactualuserpath -Force -Verbose
                                #Copy-Item -Recurse -Filter * -Path $lolink\* -Destination $sdbxactualuserpath-Force -Verbose
                                
                                #Get-ChildItem -Path $lodocs\* | Copy-Item -Recurse -Filter * -Destination $sdbxactualuserpath -Force -Verbose

                                #Copy-Item -Recurse -Filter * -Path $lomus\* -Destination $sdbxactualuserpath -Force -Verbose


         
                            }   
                    
                    elseif ($yesNoVariable -eq "n")
                        {
                        Write-Host "She said NO! If only he had taken her advise more frequently."
                        Write-host "Wrong Answer..." -ForegroundColor DarkRed -BackgroundColor Red
                       
                        }
                        
                <#     Eventually add delete of sandbox folder?????????       
                $yesNoVariable = read-host "Check any errors and make sure you are ready to accept the consequences... Are you ready to delete the old and moldy [y/n]"
                        if ($yesNoVariable -eq "y") {

                            write-host " " 
                            write-host "==========" 
                            write-host "Removal Started. If you didn't pay attention or double check this is gonna hurt."
                            write-host " " 
                            write-host "==========" 
                            }
                #>
                        
   

    #Configure yes choice  
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes","Copy more files on this computer."  
  
    #Configure no choice  
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No","Quit profile removal"  
  
    #Determine Values for Choice  
    $choice = [System.Management.Automation.Host.ChoiceDescription[]] @($yes,$no)  
  
    #Determine Default Selection  
    [int]$default = 0  
  
    #Present choice option to user  
    $userchoice = $host.ui.PromptforChoice("","Do more copy shenanigans?",$choice,$default)  
    }  

#If user selects No, then quit the script      
Until ($userchoice -eq 1)
Stop-Transcript

}


New-Alias -Name CopyFrom-Sandbox Copy-Goonies
#####***************************************************************#####
Function Reboot-Reason($Machine) {

<#
    .SYNOPSIS
        Find the reason a device rebooted for last 10 reboots. Returns user, process, Action, Reason and Reason Code. 
    
    .EXAMPLE
        Reboot-Reason c9svr119v

            Date       : 10/4/2018 3:41:14 PM
            User       : CASSCOUNTY\CRott
            Process    : Explorer.EXE
            Action     : restart
            Reason     : Hardware: Maintenance (Unplanned)
            ReasonCode : 0x4010001
            Comment    : Upgrade to console

            Date       : 9/27/2018 10:42:42 AM
            User       : CASSCOUNTY\CRott
            Process    : Explorer.EXE
            Action     : restart
            Reason     : Other (Unplanned)
            ReasonCode : 0x5000000
            Comment    :

            Date       : 9/27/2018 9:33:57 AM
            User       : CASSCOUNTY\CRott
            Process    : C:\WINDOWS\Explorer.EXE (C9SVR119V)
            Action     : restart
            Reason     : Other (Unplanned)
            ReasonCode : 0x5000000
            Comment    :


            Date       : 8/28/2018 10:24:25 AM
            User       : CASSCOUNTY\CRott
            Process    : C:\WINDOWS\Explorer.EXE (C9SVR119V)
            Action     : restart
            Reason     : Security issue (Planned)
            ReasonCode : 0x84050013
            Comment    :

            Date       : 8/28/2018 10:24:25 AM
            User       : CASSCOUNTY\CRott
            Process    : Explorer.EXE
            Action     : restart
            Reason     : Security issue (Planned)
            ReasonCode : 0x84050013
            Comment    :

            Date       : 7/26/2018 1:25:58 PM
            User       : CASSCOUNTY\CRott
            Process    : C:\WINDOWS\Explorer.EXE (C9SVR119V)
            Action     : restart
            Reason     : Application: Maintenance (Planned)
            ReasonCode : 0x84040001
            Comment    :

            
    .DESCRIPTION
    Find the reason a device rebooted in a snapshot - helpful with servers where a reboot reason is required. Script courtesty of Grant Harrington with FMSCUG :) 
#>

    #$Machine = "C9svr119v" 
    Get-WinEvent -FilterHashtable @{logname='System'; id=1074} -ComputerName $Machine | select * -First 10 | foreach {
     
                        $WinEventProperties = [ordered]@{
                    Date = $_.TimeCreated
                    User = $_.Properties[6].Value
                    Process = $_.Properties[0].Value
                    Action = $_.Properties[4].Value
                    Reason = $_.Properties[2].Value
                    ReasonCode = $_.Properties[3].Value
                    Comment = $_.Properties[5].Value
                              } #end WinEventProperties
                        
                        $ObjWinEvent = New-Object -TypeName PSObject -Property $WinEventProperties
                        Write-Output $ObjWinEvent
    }
    #endregion Get-WinEvent System 1074 (Reboot Reason) 
}
#####***************************************************************#####

Function Printer-List($DeptName) {
   
<#
    .SYNOPSIS
     This will perform a Get-Printer lookup based on the name of the device. You can enter a partial name if needed to narrow down by department. 
    
    .EXAMPLE
     Printer-List SAT
            Name               Comment                                             PrinterStatus Location                                   DriverName
            ----               -------                                             ------------- --------                                   ----------
            SAT-P1012074       Main Hallway/Cubicle Area (314S)                           Normal Courthouse/3rd Floor/SAT                   HP LaserJet M604 PCL-6
            SAT-P4015-3-PCL6   Outside Conference Room (431S) (SATP5)                     Normal Courthouse/4th Floor/SAT                   HP Universal Printing PCL 6 (v5.6.5)
            SAT-P4015-2-PCL6   Main Hallway/Cubicle Area (314S)                           Normal Courthouse/3rd Floor/SAT                   HP Universal Printing PCL 6 (v5.6.5)
            SAT-P4015-1-PCL5   CAN BE DELETED - Restitution (314S)                        Normal CAN BE DELETED - Courthouse/3rd Floor/SAT  HP Universal Printing PCL 6 (v5.6.5)
            SAT-P1012410       Main Reception Area (431S)                                 Normal Courthouse/4th Floor/SAT                   HP LaserJet M506 PCL-6
            SAT-P1012409       Main Reception Area (431S)                                 Normal Courthouse/4th Floor/SAT                   HP LaserJet M506 PCL-6
            SAT-P1011108       Restitution (314S)                                         Normal Courthouse/3rd Floor/SAT                   HP LaserJet P3011/P3015 PCL6 Class Driver
            SAT-MP6002         Back Hallway (418S)                                        Normal Courthouse/4th Floor/SAT                   Gestetner MP 6002 PCL 6
            SAT-M601DN-1-PCL6  Reception Area (431S) (SATP4)                              Normal Courthouse/4th Floor/SAT                   HP LaserJet 600 M601 M602 M603 PCL6
            SAT-LD150SP-1-PCL6 Back Hallway (418S) (SATP1) Lanier Copier                  Normal Courthouse/4th Floor/SAT                   RICOH Class Driver
            SAT-GX420d-2-EPL   Main Hallway/Cubicle Area (314S)                           Normal Courthouse/3rd Floor/SAT                   ZDesigner GX420d (EPL)
            SAT-GX420d-1-EPL   Cubicle Area (431S)                                        Normal Courthouse/4th Floor/SAT                   ZDesigner GX420d (EPL)
            SAT-ES656-1-PCL6   Back Hallway (418S) Toshiba Copier/Used for copying        Normal Courthouse/4th Floor/SAT                   TOSHIBA e-STUDIO656 PCL6 V4
            SAT-ES556-1-PCL6   Copy Room (316S)                                           Normal Courthouse/3rd Floor/SAT                   TOSHIBA e-STUDIO556 PCL6 V4
            SAT-5550-1-PCL6    Back Hallway (418S) Color                                TonerLow Courthouse/4th Floor/SAT                   HP Color LaserJet 5550 PCL6 Class Driver
            SAT-4350-1-PCL6    Cubicle Area (431S) (SATP3)                                Normal Courthouse/4th Floor/SAT                   HP Universal Printing PCL 6 (v5.6.5)   
    .DESCRIPTION
    This queries against PS1 if there is a printer out there not associated to this server it WILL NOT BE ON THE LIST. 

     Script is in process - suggestions welcome for ways you would like to search or interact with printers in this list. 
#>
    
    Get-Printer -name "$DeptName*" -ComputerName ps1 | Format-Table -Property Name,Comment,PrinterStatus,Location,DriverName -AutoSize
}

<# Future Expansion
####################################### To Try and get it to search by comment
#(Get-Printer).comment | where {$_ -like 'main'} 
#>
########################################
#####***************************************************************#####
Function Printer-SuicideWatch() {
<#
.SYNOPSIS
c9svr91v spooler is fucked  

.DESCRIPTION
Run this to launch a PS window that will monitor status of the spooler every minute and will restart it if it dies. Leave this window running.

.EXAMPLE
Printer-SuicideWatch

Output: 
[11/13/18 14:59:37]  -->   Print Service is Running :)
[11/13/18 15:00:37]  -->   Print Service is Running :)
[11/13/18 15:01:37]  -->   Print Service is Running :)

#>

    $usershit = Read-Host "First Initial - Last Name?"
    $WithDomain = get-credential -Message "?" -User casscounty\$usershit 
   
        Start-Process powershell -Credential $WithDomain -Argument '\\c9svr119v\Sandbox$\Scripts\CLRPrintSpoolerSuicideWatch.ps1'

}  
#####***************************************************************#####
#The Everything Module: So many things need multiple 
#modules lets just open them all at once

 
Function Initialize-All365() {


<# ##From the web - these 12 will get it done too
    
        $domainHost= "casscounty"
        $credential = Get-Credential

        #Import MSOL Service
            Connect-MsolService -Credential $credential
            Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
        #Import SharePoint Online
            Connect-SPOService -Url https://$domainHost-admin.sharepoint.com -credential $credential
            Import-Module SkypeOnlineConnector
        #Import Skype for Business
            $sfboSession = New-CsOnlineSession -Credential $credential
            Import-PSSession $sfboSession
        #Import Exchange Online 
            $exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://ps.outlook.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
            Import-PSSession $exchangeSession
        #Import Security and Compliance Online
            $SccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $credential -Authentication "Basic" -AllowRedirection
            Import-PSSession $SccSession -Prefix cc
   
   
        #********************************Disconnect after use - need to write this up ********************************
       Remove-PSSession $sfboSession ; Remove-PSSession $exchangeSession ; Remove-PSSession $SccSession ; Disconnect-SPOService
     
    #   Source Material 
    #   https://docs.microsoft.com/en-us/office365/enterprise/powershell/connect-to-all-office-365-services-in-a-single-windows-powershell-window    
  ###End Ghetto Website stuff#>
    
  [CmdletBinding()]
    Param(
            [Parameter(Mandatory=$True)]
            [string]$creds
        )
    Stop-Transcript

    If ($creds -eq "q"){break}

        $UserAlias = $creds #Read-Host "Enter Your Last Name, First Initial Creds"
        $emailinfo = "@casscountynd.gov"
        $OpenAllCreds = Get-Credential -User $UserAlias$emailinfo -Message "Password?"
        $OrgName = "casscounty"
    
        # Does SharePoint Module Exist
            if (Get-Module -ListAvailable -Name Microsoft.Online.SharePoint.PowerShell) {
                    Write-Host "SharePoint Module Exists" -ForegroundColor Red
                }    
                else {
                    Write-Host "SharePoint Module Doesn't Exist - Adding now..." -ForegroundColor Red
                    Install-Module -Name Microsoft.Online.SharePoint.PowerShell -SkipPublisherCheck -AllowClobber -Force
                    Import-Module Microsoft.Online.SharePoint.PowerShell -Force
                }
        ## Open that SharePoint Stuff Now - Use RottC@casscountynd.gov
            Do {
                    Connect-SPOService -URL https://$orgName-admin.sharepoint.com -Credential $OpenAllCreds
                    Get-SPOUser -Site https://casscounty.sharepoint.com -loginname $OpenAllCreds.UserName | Select-Object *
                    $ShareDone = "Done"

                } Until ($ShareDone -eq "Done") 
        ##End of SharePoint Install

        ################################################################
        ###AzureAD Install
        if (Get-Module -ListAvailable -Name AzureAD) {
            Write-Host "Azure Module Exists" -ForegroundColor Red
        }    
            else {
                Write-Host "Azure Module Doesn't Exist - Adding now..." -ForegroundColor Red
                Install-Module -Name AzureAD -SkipPublisherCheck -AllowClobber -Force
        }
        Do {
            Connect-AzureAD -credential $OpenAllCreds
            #Get-AzureADUser -Filter "userPrincipalName eq $OpenAllCreds"
            $AzureUser = "Done"
        } Until ($AzureUser -eq "Done")
            
        #End of Azure AD Install

        ################################################################
        ##Start of MSOnline Module
            if (Get-Module -ListAvailable -Name MSOnline) {
                Write-Host "MSOnline Module Exists" -ForegroundColor Red
            }    
                else {
                    Write-Host "MSOnline Doesn't Exist - Adding now..." -ForegroundColor Red
                    Install-Module -Name MSOnline -SkipPublisherCheck -AllowClobber -Force
                    Import-Module MSOnline -Force
            }
        ##Open the MSOlService - User RottC@casscountynd.gov
            Do {
                Connect-msolservice -credential $OpenAllCreds
                get-msoluser -UserPrincipalName $OpenAllCreds.UserName | FT DisplayName,Licenses
                $MSOnlineUser = "Done"
            } until ($MSOnlineUser -eq "Done")
    ##End of MSOnline Install 

         ################################################################
         ##Start of Exchange Module 
            $ExchangeAdmin = $OpenAllCreds
            $XChngSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/PowerShell-LiveID/ -Credential $ExchangeAdmin -Authentication "Basic" -AllowRedirection
            Import-PSSession $XChngSession
            $AlltheExchangeInfo = Get-Mailbox -Identity $UserAlias | FT -Property alias,UserprincipalName,accountdisabled,isdirsynced,isvalid
            Write-Host "Exchange Added - Check it `n" -ForegroundColor Red
            $AlltheExchangeInfo

    ##End of Exchange Module

         ################################################################
        ##Start of Lync-Module
        if (Get-Module -ListAvailable -Name LyncOnlineConnector) {
            Write-Host "Lync Online Connector Module Exists" -ForegroundColor Red
        }    
            else {
                Write-Host "Lync Online Connector Doesn't Exist - Adding now..." -ForegroundColor Red
                Import-Module SkypeOnlineConnector -Force 
                Import-Module LyncOnlineConnector -Force 
        }
        ##Open the Lync/Skype - User RottC@casscountynd.gov
        Do {
            $CSSession = New-CsOnlineSession -credential $OpenAllCreds 
            Import-PSSession $CSSession -AllowClobber
            Get-CsOnlineUser $UserAlias| FT -Property alias,isvalid,teamsupgradeeffectivemode,originatingserver -autosize
            $TeamSkype = "Done"
        } until ($TeamSkype -eq "Done")
        
    ##End of Lync/Skype Module

         ################################################################
         ##Start of Teams Module
        if (Get-Module -ListAvailable -Name MicrosoftTeams) {
            Write-Host "Teams Module exists" -ForegroundColor Red
        }
        else {
            Write-Host "Teams Module does not exist" -ForegroundColor Red
            Install-Module -Name MicrosoftTeams -Force -AllowClobber
            Import-Module -Name MicrosoftTeams -Force -AllowClobber
        }
        Connect-MicrosoftTeams -Credential $OpenAllCreds
        Get-Team -User $OpenAllCreds.UserName
    ##End of Teams
        ###############################################################################################

        if (Get-Module -ListAvailable -Name Microsoft.Graph.Intune) {
            Write-Host "Intune Module exists" -ForegroundColor Red
            Install-Module -Name Microsoft.Graph.Intune -Force -AllowClobber
            Import-Module -Name Microsoft.Graph.Intune -Force -AllowClobber
        }
             
        else {
            Write-Host "Intune Module does not exist" -ForegroundColor Red
            Install-Module -Name Microsoft.Graph.Intune -Force -AllowClobber
            Install-Module -name MSGraphFunctions
            Import-Module -Name Microsoft.Graph.Intune -Force
        }
        Connect-MSGraph -Credential $OpenAllCreds
        
        $stuff = Get-IntuneDeviceCompliancePolicy
            Write-Output "Current Intune Compliance Items"
            $stuff.displayname

         ################################################################
         ##Start of Compliance & Security Module

        $SecSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid -Credential $OpenAllCreds -Authentication "Basic" -AllowRedirection 
        Import-PSSession $SecSession 
        $Host.UI.RawUI.WindowTitle = $OpenAllCreds.UserName + "MSOnline Admin Session" 
        Write-Host "Sec & Compliance Done" -ForegroundColor Red
        Get-AntiPhishPolicy | ft IDentity,AdminDisplayName,Enabled,ExcludedDomains,ExcludedSenders
    ##End of Compliance & Security Module 

    function Start-BigBrotherAdvanced() {
        # .EXTERNALHELP C:\Users\rottc\OneDrive - Cass County\Desktop\GIT Stuff\IT Server Profiles-Modules\HelpDocs\BigBrotherTranscript.xml
    
        [CmdletBinding()]
            Param (
                [Parameter(Mandatory=$True)]        
                [string]$Name,
                [Parameter(Mandatory=$False)]        
                [switch]$CassIT,
                [string]$subfolder,
                [String]$ClearLog207,
                [switch]$dated,
                [string]$ClearLogIT
                )
        ##Where you want to save the logs to --- Default save is to c9svr207v\Serverlogs$
        
        ##Uses a Switch to determine where the log should go either 207 logs folder or CassIT locally
            if($CassIT.IsPresent){
                $logFolder = "C:\CassIT\Logs\"
            }
            Else {
                $logFolder = "\\C9SVR207V\ServerLogs`$\"
            }
    
        ##Do you need to clear the contents of a log file 
            if($ClearLog207){
                #Write-Host "Clear Log on 207?"  $ClearLog207
                $Clear207 = Clear-Content "\\c9svr207v\ServerLogs$\$ClearLog207.log"
            }
            if($ClearLogIT){
                Write-Host $ClearLogIT
                $ClearIT = Clear-Content "C:\CassIT\$ClearLogIT.log"
            }
    
        ##Use for new log with date in name            
            if($dated.IsPresent){
                $NamedTranscript = "$Name" 
                $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
                $ILogName = $NamedTranscript + "_" + $IDate + ".log"
    
                if ($subfolder) {
                    $sub = "$subfolder"
                    $sub2 = $sub + "\"
                    $ILog = $LogFolder + $sub2 + $ILogName
                    
                } 
                Else {
                    $ILogName = $NamedTranscript + "_" + $IDate + ".log"
                    $ILog = $LogFolder + $ILogName
                }  
                
                Start-Transcript -Path "$ILog" -NoClobber -Append
                Break
            }
    
        ##Otherwise just let her buck and use the name provided
            Else{                
                $NamedTranscript = "$Name" 
                $ILogName = $NamedTranscript + ".log"
    
                if ($subfolder) {
                    $sub = "$subfolder"
                    $sub2 = $sub + "\"
                    $ILog = $LogFolder + $sub2 + $ILogName
                }   
                Else {
                $ILog = $LogFolder + $ILogName
                }   
            }
        
        Start-Transcript -Path "$ILog" -NoClobber -Append
        }
      

    ##Admin stuff to start transcript/and see what sessions and modules installed
    $TranName = Read-Host "Name Yo transcript!"   
        #Start-BigBrother -Name $TranName
        Start-BigBrotherAdvanced $TranName -CassIT -dated     
        Get-PSSession
        Get-Module | FT
}
#####***************************************************************#####
Function SCCM-Module() {
    #Import-Module ConfigurationManager
    
            function Get-CMModule {
             [CmdletBinding()]
             param()
                Try {
                    Write-Verbose "Attempting to import SCCM Module"
                    Import-Module (Join-Path $(Split-Path $ENV:SMS_ADMIN_UI_PATH) ConfigurationManager.psd1) -Verbose:$false
                    Write-Verbose "Successfully imported the SCCM Module"
                }
                Catch
                {
                    Throw "Failure to import SCCM Cmdlets."
                } 
        }   
    Get-CMModule


        function Test-ConfigMgrAvailable {
        [CMdletbinding()]
        Param (
        )
            try{
                if((Test-Module -ModuleName ConfigurationManager) -eq $false){throw "You have not loaded the configuration manager module please load the appropriate module and try again."}
                write-Verbose "ConfigurationManager Module is loaded"
                Write-Verbose "Checking if current drive is a CMDrive"
                if((Get-location).Path -ne (Get-location -PSProvider 'CmSite').Path){throw "You are not currently connected to a CMSite Provider Please Connect and try again"}
                write-Verbose "Succesfully validated connection to a CMProvider"
                write-verbose "Passed all connection tests"
                return $true
            }
            catch {
                $errorMessage = $_.Exception.Message
                write-error -Exception CMPatching -Message $errorMessage
                return $false
            }
    }
    Test-ConfigMgrAvailable

        function Test-Module
        {
            [CMdletbinding()]
            Param
            (
                [Parameter(Mandatory = $true)]
                [String]$ModuleName 
            )
            If(Get-Module -Name $ModuleName) {
                return $true
            }
            If((Get-Module -Name $ModuleName) -ne $true) {
                return $false
            }
        }    
    Test-Module ConfigurationManager 

Set-Location SC5:
Get-CMSite

}
#####***************************************************************#####
Function NoReply-Maint(){

    ##Connect to Exchange Online and Compliance 

    $LoadSessions = Read-Host "Do you need to log into Exchange Online (y/n)?"

        Switch ($LoadSessions)
        {
            Y {
                Initialize-All365
            }
            N {Write-Host "Moving on..."}
        }

    ##Define Mailbox 
   # Start-BigBrotherAdvanced ADFSRun -CassIT -dated
        $noreply = "adfs_bk@casscounty.onmicrosoft.com"
    ##Get Mailbox Stats
        Write-Host -ForegroundColor Green -NoNewLine "Mailbox Stats for No-Reply@casscountynd.gov"
        Get-MailboxStatistics -Identity $noreply | Select DisplayName, @{n="Total Size (GB)";e={[math]::Round(($_.TotalItemSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1GB),2)}},ItemCount,TotalItemSize,DeletedItemCount,TotalDeletedItemSize,LastLogonTime
    ##Get Specific Folder Stats
        $inbox = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "Inbox" } | FL Name,FolderSize,ItemsInFolder  
        $sentitems = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "Sent Items" } | FL Name,FolderSize,ItemsInFolder  
        $deleteditems = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "Deleted Items" } | FL Name,FolderSize,ItemsInFolder  
        #$VMSync = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "VMSyncM" } | FL Name,FolderSize,ItemsInFolder  

        Write-Host -ForegroundColor Red -NoNewLine "Only you can prevent Sent Mail overloads"
            $sentitems
        Write-Host -ForegroundColor Cyan -NoNewLine "This is your inbox on drugs"    
            $inbox     
       # Write-Host -ForegroundColor Yellow -NoNewLine "VMSyncMaster is master of none"
       #     $VMSync
        Write-Host -ForegroundColor Cyan -NoNewLine "This is your #deletedItems that never ever go away"    
        $deleteditems   
            
        Write-Host -ForegroundColor Green -NoNewLine "Specifics of ALL the largest folders in ADFS_BK Mailbox"
        Get-MailboxFolderStatistics -Identity $noreply | where {$_.ItemsInFolder -gt "10" } | Sort-Object ItemsInFolder -Descending | FT Name,FolderSize,ItemsInFolder  
    
        #Get-MailboxFolderStatistics -Identity $noreply | Sort-Object ItemsInFolder -Descending | FT Name,FolderSize,ItemsInFolder  
    
    
    ##Ask actionable question
    
        $DeletetheStuff = Read-Host "Do you need to delete items received from last 3 month? (y/n)"
    
        Switch ($DeletetheStuff)
        {
            Y {
                $fromdate = (Get-Date).AddMonths(-2).ToShortDateString()
                $todate = (Get-Date).AddMonths(-1).ToShortDateString()
                #$todate = (Get-Date).AddDays(-1).ToShortDateString()
                #$sub = (subject=message*)
    
                    [String]$searchrecd = "received:$fromdate..$todate"
                    Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $searchrecd -DeleteContent -Force
    
                    [String]$searchsent = "sent:$fromdate..$todate"
                    Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $searchsent -DeleteContent -Force
                   
                    #[String]$VMSyncFold = 'subject:"System synchronisation message"'
                    #Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $VMSyncFold -DeleteContent -Force
                    
                    [String]$MSGLIne = 'subject:"Message""'
                    Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $MsgLine -DeleteContent -Force
                    
                    [String]$MSGLIne2 =  '(subject=message*)'
                     Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $MsgLine2 -DeleteContent -Force

                            $inbox = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "Inbox" } | FL Name,FolderSize,ItemsInFolder  
                            $sentitems = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "Sent Items" } | FL Name,FolderSize,ItemsInFolder  
                           # $VMSync = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "VMSyncM" } | FL Name,FolderSize,ItemsInFolder  

                            Write-Host -ForegroundColor Red -NoNewLine "Only you can prevent Sent Mail overloads"
                                $sentitems
                            Write-Host -ForegroundColor Cyan -NoNewLine "This is your inbox on drugs"    
                                $inbox     
                           # Write-Host -ForegroundColor Yellow -NoNewLine "VMSyncMaster is master of none"
                             #   $VMSync

            }
            N { 
        $DeletetheStuffdays = Read-Host "Do you need to delete items received from last 5 days? (y/n)"
    
          Switch ($DeletetheStuffdays)
          {
              Y {
                  $fromdate = (Get-Date).AddMonths(-5).ToShortDateString()
                  $todate = (Get-Date).AddMonths(-1).ToShortDateString()
                  #$todate = (Get-Date).AddDays(-1).ToShortDateString()
                  #$sub = (subject=message*)
      
                      [String]$searchrecd = "received:$fromdate..$todate"
                      Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $searchrecd -DeleteContent -Force
      
                      [String]$searchsent = "sent:$fromdate..$todate"
                      Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $searchsent -DeleteContent -Force
                     
                      #[String]$VMSyncFold = 'subject:"System synchronisation message"'
                      #Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $VMSyncFold -DeleteContent -Force
                      
                      [String]$MSGLIne = 'subject:"Message""'
                      Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $MsgLine -DeleteContent -Force
                      
                      [String]$MSGLIne2 =  '(subject=message*)'
                       Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery $MsgLine2 -DeleteContent -Force

                              $inbox = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "Inbox" } | FL Name,FolderSize,ItemsInFolder  
                              $sentitems = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "Sent Items" } | FL Name,FolderSize,ItemsInFolder  
                             # $VMSync = Get-MailboxFolderStatistics -Identity $noreply | where {$_.Name -eq "VMSyncM" } | FL Name,FolderSize,ItemsInFolder  

                              Write-Host -ForegroundColor Red -NoNewLine "Only you can prevent Sent Mail overloads"
                                  $sentitems
                              Write-Host -ForegroundColor Cyan -NoNewLine "This is your inbox on drugs"    
                                  $inbox     
                             # Write-Host -ForegroundColor Yellow -NoNewLine "VMSyncMaster is master of none"
                               #   $VMSync

              }
              N {Write-Host -ForegroundColor Magenta `n "Puff puff, give. Puff puff, give. You fuckinâ€™ up the rotation. -Smokey"}  
        }
            }  
        }
    }
<#Search-Mailbox $noreply -SearchQuery sent>"04/01/2019"
Add-DistributionGroupMember -Identity "{Bldg}-All Courthouse Staff" -Member "{Cass}-Finance"

Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery '(Received:12/02/2019..12/11/2019)' -DeleteContent -Force


Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery '(Received:04/01/2019..04/30/2019)' -EstimateResultOnly -SearchDumpsterOnly
Restore-RecoverableItems -Identity adfs_bk@casscounty.onmicrosoft.com -FilterStartTime "04/01/2019 12:00:00 AM" -FilterEndTime "04/30/2019 11:59:59 PM"
Get-MailboxStatistics -Identity adfs_bk@casscounty.onmicrosoft.com | Select DisplayName, @{n="Total Size (GB)";e={[math]::Round(($_.TotalItemSize.ToString().Split("(")[1].Split(" ")[0].Replace(",","")/1GB),2)}}, StorageLimitStatus
Search-Mailbox -Identity adfs_bk@casscounty.onmicrosoft.com -SearchQuery '(Sent:09/10/2018..03/30/2019)' -DeleteContent -Force
#>
#####***************************************************************#####
#OnCall Cheat Document
##Printer Listing for the Jail
##PCs at the jail
###Phone List
##Phone number for MC & Booking
##CoF onCall #

$foregroundcolor = "Cyan"
$redcolor = "red" 
$ncVer = "1.0"


function Oncall-NinjaMenu {  

[cmdletbinding()]
param()

    ##########################################
    #            Ninja Center Menu           #
    ##########################################
    Write-Host `n"**************************************"
    Write-Host -NoNewline "*"
    Write-Host -NoNewLine "Cass County OnCall Ninja Center " $ncVer -ForeGroundColor Green
    Write-Host  "*" -ForegroundColor White
    Write-Host "**************************************`n"



        ##########################################
        ##Active Directory Stuff    
            #Write-Host -NoNewLine "<" -foregroundcolor $foregroundColor
            Write-Host -NoNewLine "Active Directory" -ForegroundColor Magenta
            #Write-Host -NoNewLine "> " -foregroundcolor $foregroundColor
            Write-Host -NoNewLine " ["
            Write-Host -NoNewLine "A" -foregroundcolor $foregroundColor
            Write-Host -NoNewLine "]"
        ##A1
            Write-Host -NoNewLine `t`n "A1 - " -foregroundcolor $foregroundcolor
            Write-host -NoNewLine "Look up a user contact card "
            Write-host -NoNewLine " - " -ForegroundColor Gray
            Write-Host -NoNewline "(Contact-Card)" -ForegroundColor Gray
        ##A2
            Write-Host -NoNewLine `t`n "A2 - " -foregroundcolor $foregroundcolor
            Write-host -NoNewLine "Look up a computer number with description"
            Write-host -NoNewLine " - " -ForegroundColor Gray
            Write-Host -NoNewline "(Whats-theNumber)" -ForegroundColor Gray
        ##A3
            Write-Host -NoNewLine `t`n "A3 - " -foregroundcolor $foregroundcolor
            Write-host -NoNewLine "Look up full/partial phone number"
            Write-host -NoNewLine " - " -ForegroundColor Gray
            Write-Host -NoNewline "(LKPhone-Lookup)" -ForegroundColor Gray
        ##A4
            Write-Host -NoNewLine `t`n "A4 - " -foregroundcolor $foregroundcolor
            Write-host -NoNewLine "Unlock User Acct" -ForegroundColor $redcolor 
            Write-host -NoNewLine " - " -ForegroundColor Gray
            Write-Host -NoNewline "(Unlock-User)" -ForegroundColor Gray
        ##A5
            Write-Host -NoNewLine `t`n "A5 - " -foregroundcolor $foregroundcolor
            Write-host -NoNewLine "Find Lockouts" -ForegroundColor $redcolor 
            Write-host -NoNewLine " - " -ForegroundColor Gray
            Write-Host -NoNewline "(WhoIs-LockedOut)" -ForegroundColor Gray

        ##A6
            Write-Host -NoNewLine `t`n "A6 - " -foregroundcolor $foregroundcolor
            Write-host -NoNewLine "General and Helpful Phone Numbers"  
        ##A7
            Write-Host -NoNewLine `t`n "A7 - " -foregroundcolor $foregroundcolor
            Write-host -NoNewLine "Make the phone stop ringing" `n`n 


        ##########################################
        ##Jail Related
            #Write-Host -NoNewLine "<" -foregroundcolor $foregroundColor
            Write-Host -NoNewLine "Jail Shenanigans" -ForegroundColor Magenta
            #Write-Host -NoNewLine "> " -foregroundcolor $foregroundColor
            Write-Host -NoNewLine " ["
            Write-Host -NoNewLine "J" -foregroundcolor Yellow
            Write-Host -NoNewLine "]"
    
            Write-Host -NoNewLine `t`n "J1 - " -ForegroundColor Yellow
            Write-host -NoNewLine "Common Jail Phone numbers"
            Write-Host -NoNewLine `t`n "J2 - " -foregroundcolor Yellow
            Write-host -NoNewLine "Jail Printers"
            Write-Host -NoNewLine `t`n "J3 - " -foregroundcolor Yellow
            Write-host -NoNewLine "Jail PCs" `n`n


        ##########################################
        ##Patrol/Sheriff Related
            #Write-Host -NoNewLine "<" -foregroundcolor $foregroundColor
            Write-Host -NoNewLine "Patrol and Sheriff Stupidity" -ForegroundColor Magenta
            #Write-Host -NoNewLine "> " -foregroundcolor $foregroundColor
            Write-Host -NoNewLine " ["
            Write-Host -NoNewLine "P" -foregroundcolor Green
            Write-Host -NoNewLine "]"
    
            Write-Host -NoNewLine `t`n "P1 - " -ForegroundColor Green
            Write-host -NoNewLine "MDT Netmotion Static IPs"
            Write-Host -NoNewLine `t`n "P2 - " -ForegroundColor Green
            Write-host -NoNewLine "Current SRU list" `n`n`n
        <#    Write-Host -NoNewLine `t`n "P2 - " -foregroundcolor Green
            Write-host -NoNewLine "LEC Stuff" -ForegroundColor $redcolor -BackgroundColor DarkGray
            Write-Host -NoNewLine `t`n "P3 - " -foregroundcolor Green
            Write-host -NoNewLine "MDTs" -ForegroundColor $redcolor -BackgroundColor DarkGray  `n`n`n #>


        ##########################################
        ##City of Fargo Options
            #Write-Host -NoNewLine "<" -foregroundcolor White
            Write-Host -NoNewLine "So you think you need to call City of Fargo" -ForegroundColor $redcolor
            #Write-Host -NoNewLine "> " -foregroundcolor White
            Write-Host -NoNewLine " ["
            Write-Host -NoNewLine "COF" -foregroundcolor $foregroundColor
            Write-Host -NoNewLine "]"
            Write-Host -NoNewLine `t`n "COF -" -foregroundcolor $redcolor
            Write-host -NoNewLine " Well Ok then - let's run through it "`n`n



  
    Write-Host `n"Type 'q' or hit enter to exit - You can parachute out of any script with Ctrl+C" -foregroundcolor Gray
 
    $sel = Read-Host `n"Which option?"



    ###########################################################
    #  End of Menu View - Start of Actions                    #
    ###########################################################   


    ##########################################
    #  Active Directory A1-3 Options         #
    ##########################################              

    Switch ($sel) {
        "A1" {
                Clear-Host
                Write-Host "You selected A1 - User AD Contact-Card Lookup"
                #Write-Host "Enter the partial name of the person you are looking for" -ForegroundColor $redcolor
                $Contact = Read-Host "Enter the partial name of the person you are looking for"
                Contact-Card $Contact}


        "A2" {
                Clear-Host  
                Write-Host "You selected A2 - Computer lookup by AD description"          
                $Whatsthenum = Read-Host "Enter the full or partial AD Description you want to lookup" 
                Whats-theNumber $Whatsthenum}
        
        
        "A3" {
                Clear-Host
                Write-Host "You selected A3 - Lookup that phone number that just woke you up before calling it back" #-ForegroundColor $redcolor
                Write-Host "You can put in a full or partial phone number (desk or cell) and it will look up the number..." -ForegroundColor $redcolor
                Write-Host "Thank Levon for this one :)" -ForegroundColor Gray
                $Partial = Read-Host "`n What Number are we looking up? "
                LKPhone-Lookup $Partial}

        "A4" {
                Clear-Host  
                Write-Host "You selected A4 - Unlock a User AD Acct"          
                $idiot = Read-Host "Enter the full alias of the user that is locked out" 
                Unlock-Idiot $idiot}
     
        "A5" {
                Clear-Host  
                Write-Host "You selected A5 - Find all current locked out users"          
                WhoIs-LockedOut}
  
            
        "A6" {
                Clear-Host  
                Write-Host -NoNewLine "County Directory Located at: "
                Write-Host -NoNewLine "https://casscounty.sharepoint.com/Documents/SitePages/Home.aspx" -ForegroundColor Red
                Write-Host "Browser will open directly to staff directory page in 5 Seconds"
                start-sleep 5 
                #Start "https://casscounty.sharepoint.com/Documents/Phone%20Directories/Forms/AllItems.aspx"  
                #Start 'https://casscounty.sharepoint.com/Documents/SitePages/Home.aspx'         
                }       
        "A7" {
            Clear-Host  
            Write-Host -ForegroundColor Gray "How to make the Ringing Stop - according to Jolene...
            On-Call Phone System

            User calls 241-5750 after hours.
            Greeting Plays with options to Leave Name, etc.
            User Leaves a Message.

            System sends call to On-Call person immediately. 
                (Incoming number on your cell phone will probably be 701-356-2641)
                If you don’t answer System will try again in 1 minute, then 5 minutes, etc.`n
    
            "
            
            Write-Host -ForegroundColor Magenta "`t`t`tWhen you answer the call and want to listen to the message:
            Enter 1234 for mailbox and 1234 for password.`n"

            Write-Host "`t`t`tMessage will play – when done listening to the message" -NoNewline
            Write-Host  -ForegroundColor Magenta  " *3 to delete it`n"
            
            Write-Host -ForegroundColor Yellow "`t`t`t*#    *#    *#    *#    *#    *#    *#    *#    *#    *#    *#    *#    *#
            To skip listening to the message and to kill the incoming call. -->" 
            
             Write-Host -ForegroundColor Magenta "    `n`n`t`t`t`t`t`t*# `n`n"
            
            
            Write-Host -ForegroundColor Yellow "`t`t`t*#    *#    *#    *#    *#    *#    *#    *#    *#    *#    *#    *#    *#"

            Write-Host -ForegroundColor White "`n`t`t`tYou can listen to the message thru the Service Desk".

            Write-Host -ForegroundColor White "`n`t`t`tTo access the voicemail anytime.
                Dial 241-1000.
                Enter 1234 for mailbox.
                Enter 1234 for password.`n"
            }                   

    ##########################################
    #        Jail Phone numbers 01/09/19     #
    ##########################################              
        
         "J1" {
                 Clear-Host
                 Write-Host "`n Common Jail Phone Numbers `n" -ForegroundColor Cyan

             ####Contact Card Notice      
                 Write-Host -NoNewLine " To look up an individual use selection A1 or cmdlet:" -ForegroundColor Green       
                     Write-Host -NoNewLine " A1" -foregroundcolor Green
                     Write-Host -NoNewLine " Contact-Card" -foregroundcolor Green
                     Write-Host `n          
             
             #####Frequently Used Numbers
                 Write-Host -NoNewLine `t `t "Frequently Used " -foregroundcolor Cyan
                 Write-Host "    
                        271-2950	Booking Main Line
                        271-2826	Master Control
                        271-2933	Master Control
	
                        271-2956	B&G Jail
                        271-2922	Corporal’s Office
                        271-2930	Sergeant’s Office" `n 
	
             #####
                 Write-Host -NoNewLine `t `t "PODS " -foregroundcolor Cyan
                 Write-Host "   
                        271-2825	Charlie Staff
                        271-2844	Delta Staff
                        271-2879	E Main Staff
                        271-2890	G Main Staff
                        271-2865	H Main Staff
                        271-2824	Sigma Staff
                        271-2913	Work Release" `n 
	
             #####
                 Write-Host -NoNewLine `t `t "Court Transport " -foregroundcolor Cyan
                 Write-Host "   
                        241-5819    Court Holding CH	
                        241-5830    Court Transport CH	
                        241-2929    Court Transport JAI" `n 
	
             #####
                 Write-Host -NoNewLine `t `t "Medical Staff " -foregroundcolor Cyan
                 Write-Host "   
                        271-2937	Medical Staff
                        271-2938	Medical Staff
                        271-2939	Medical Staff
                        271-2940	Medical Staff" `n 
	
             #####
                 Write-Host -NoNewLine `t `t "Random Numbers you should not need while on call " -foregroundcolor Cyan
                 Write-Host "   
                        271-2900	Main Line
                        271-2916	Bond Window
                        271-2852	Program Staff
                        271-2827	Property Room
                        271-2957	Security Desk
                        241-5708	B&G Courthouse
                        271-2909	Community Supervision
                        271-2926	Training Room
                        271-2954	Food Service
                        271-2946	Video Court"
        
              }
                   

    ##########################################
    #    J2 Jail Printers                    #
    ##########################################              

         "J2" {
                Clear-Host
                Write-Host "Did the printers bite the dust??? "
                Write-Host "Jail Printers are on \\ps1" 
                Printer-List jai}
    
    ##########################################
    #    J3                   #
    ##########################################              
     
         "J3" {
                Write-Host `n"*******************************************************" -ForegroundColor Green
                Write-Host `t `t `t "   Desktop Computers" -ForegroundColor Green
                Write-Host "*******************************************************" -ForegroundColor Green
                Get-AdComputer -Filter * -SearchBase "OU=Jail,OU=CSO,OU=Desktops,OU=Internal,OU=Cass County,DC=co,DC=cass,DC=nd,DC=us" -Properties Name,description,canonicalname | FT Name,Description,CanonicalName -AutoSize

                Write-Host `n"*******************************************************" -ForegroundColor Green
                Write-Host `t `t `t "   Laptop Computers" -ForegroundColor Green
                Write-Host "*******************************************************" -ForegroundColor Green
                Get-AdComputer -Filter * -SearchBase "OU=Jail,OU=CSO,OU=Laptops,OU=Internal,OU=Cass County,DC=co,DC=cass,DC=nd,DC=us" -Properties Name,description,canonicalname | FT Name,Description,CanonicalName -AutoSize

            }


    ##########################################
    #   P1    Netmotion IPs 01/09/19         #
    ##########################################              

          "P1" {
            Clear-Host 
            Netmotion-IPs
          }



    ##########################################
    #    P2 LEC Stuff Not sure what yet      #
    ##########################################              
  
         "P2" {
            #Write-Host "Coming soon"
            Get-AdUser -SearchBase "OU=SRU,OU=CCSO,OU=Users,OU=External,OU=Cass County,DC=co,DC=cass,DC=nd,DC=us" -Filter * -Properties Name,SamAccountName,Title | Select Name,SamAccountName,Title
            }  
  
     
     
    ##########################################
    #    P3 MDT Good to know                 #
    ##########################################        

         "P3" {
            Write-Host "Coming soon"
            Break
            }
                   
  
       
    ##########################################
    #    COF                   #
    ##########################################        

         "COF" {

                Write-Host -NoNewLine `t`n "Is the user locked out? " -ForegroundColor DarkYellow
                Write-host -NoNewLine "90% of Problems are lockouts" `n -ForegroundColor Yellow
                
                Search-ADAccount -LockedOut | Ft SamAccountName,lastlogondate,lockedout


                ####Add in the locked out users - then yes or no - 
                Write-Host "Is your user listed?" -ForegroundColor Green
                $lockout = Read-Host "(y/n)"

                     ####yes takes to WhoIs-LockedOut - 
                     if($lockout -eq "y*") {
                        WhoIs-LockedOut
                     }
              
                Write-Host `n"So they aren't on the locked out list" -ForegroundColor Gray
                Write-Host "Have them Reboot" -ForegroundColor Red
                Start-Sleep -Seconds 5
                     
                     
                
                
                Write-Host `n"I know you really want to call them but..." -ForegroundColor Gray
                Start-Sleep -Seconds 5
                Write-Host "Uninstalling Netmotion and then reinstalling can help - Do that." -ForegroundColor Magenta
                 
                 #Write-Host "City of Fargo OnCall Phone #: 701--`n" -Foregroundcolor $redcolor



            }
       
               


    ###########################################################
    #  End of Actions                                         #
    ###########*****************###############################   


    ##In case of no entry 
        {($_ -like "*q*") -or ($_ -eq "")} {
            
            Write-Host `n"No input or 'q' seen... bowing out." -foregroundcolor $foregroundcolor 
            Write-Host "Type Oncall-NinjaMenu to load them menu again" -foregroundColor $foregroundColor `n 
            
            
        }          
            
    }
    ##########################################
    #        End Ninja Center Menu           #
    ##########################################

}

Set-Alias -Name Oncall -Value Oncall-NinjaMenu


<#
Patrol Netmotion IPs as of 12/21/18
Device Name	Static Address	Last user logged on
http://rdc-mobility-07.rrrdc.org:8080/client_devices.jsp
--------------------------------------------------------
C1010298	10.63.81.13	kroght
C1010299	10.63.81.43	servicedesk
C1010300	10.63.81.16	kroght
C1010301	10.63.81.25	kingm
C1010302	10.63.81.7	koerberj
C1010303	10.63.81.3	hegerb
C1010304	10.63.81.5	kroght
C1010550	10.63.81.42	servicedesk
C1010938	10.63.81.33	nitschkeb
C1010954	10.63.81.12	zundelk
C1010955	10.63.81.10	mortensonj
C1010956	10.63.81.4	scottj
C1010957	10.63.81.23	sassolundinp
C1010958	10.63.81.18	behmt
C1010959	10.63.81.19	hamesh
C1010960	10.63.81.35	hedinj
C1010961	10.63.81.17	krauser
C1010962	10.63.81.1	murrayj
C1010963	10.63.81.14	crawfordj
C1010964	10.63.81.6	hermannd
C1010965	10.63.81.24	boerboomn
C1010966	10.63.81.31	agayevr
C1010967	10.63.81.8	thompsonc
C1010968	10.63.81.15	kindr
C1011095	10.63.81.34	mcnamarat
C1011591	10.63.81.28	manningg
C1011592	10.63.81.27	thomsenc
C1012085	10.63.81.9	krauser
C1012086	10.63.81.30	nettestadl
C1012087	10.63.81.29	wiedenmanj
C1012088	10.63.81.36	murphyk
C1012473	10.63.81.37	vandeneindej
C1012474	10.63.81.20	beckiust
C1012476	10.63.81.22	longletj
C1012477	10.63.81.11	castlej
C1012478	10.63.81.26	kellerc

#>


<##Exchange 
    Write-Host -NoNewLine "<" -foregroundcolor $foregroundColor
    Write-Host -NoNewLine "Exchange"
    Write-Host -NoNewLine "> " -foregroundcolor $foregroundColor
    Write-Host -NoNewLine "["
    Write-Host -NoNewLine "E" -foregroundcolor $foregroundColor
    Write-Host -NoNewLine "]"

    Write-Host -NoNewLine `t`n "E1 - " -foregroundcolor $foregroundcolor
    Write-host -NoNewLine "Forward a mailbox"
    Write-Host -NoNewLine `t`n "E2 - " -foregroundcolor $foregroundcolor
    Write-host -NoNewLine "Clear a mailbox forward"
    Write-Host -NoNewLine `t`n "E3 - " -foregroundcolor $foregroundcolor
    Write-host -NoNewLine "See if an IP address is being relayed"`n`n

##Storage
    Write-Host -NoNewLine "<" -foregroundcolor $foregroundColor
    Write-Host -NoNewLine "Storage"
    Write-Host -NoNewLine "> " -foregroundcolor $foregroundColor
    Write-Host -NoNewLine "["
    Write-Host -NoNewLine "S" -foregroundcolor $foregroundColor
    Write-Host -NoNewLine "]"
    Write-Host -NoNewLine `t`n "S1 - " -foregroundcolor $foregroundcolor
    Write-host -NoNewLine "Connect to a NetApp controller"`n`n
#>



      <# "E1" {Forward-Email}
       # "E2" {Clear-Forward}
       # "E3" {Check-EXRelayIP}
        
                               
        "S1" {Connect-NetAppController
        
            Write-Host -NoNewLine "Type " -foregroundcolor $foregroundcolor 
            Write-Host -NoNewLine "Load-NinjaCenter " -foregroundcolor $foregroundcolor 
            Write-Host -NoNewLine "to load the menu again. `n" -foregroundcolor $foregroundcolor 
        } 
        #>    
#####***************************************************************#####
Function Deradicalize-DNS () {

$readthis = Read-Host "server name"

    $usershit = Read-Host "Who are you?"
    $WithDomain = get-credential -Message "?" -User casscounty\$usershit 



##Get all Servers in specified number OU




#ForEach that shit from array










$enterthis = New-PSSession -ComputerName $readthis -credential $WithDomain
#Start-Process Powershell -Verb RunAs  
Enter-PSSession $enterthis 

Get-DnsClientServerAddress
        Get-NetIPAddress | where {$_.IPAddress -like "10.99.*"} | Get-NetAdapter | Set-DnsClientServerAddress -ServerAddresses 10.99.133.208, 10.99.133.89


$ethernet = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where { $_.IpEnabled -eq $true}  
 
foreach ($lan in $ethernet) { 
        Write-Host `n
        Write-Host "Flushing IP addresses" -ForegroundColor Yellow 
            Sleep 2 
            $lan.ReleaseDHCPLease() | out-Null 
        Write-Host "Renewing IP Addresses" -ForegroundColor Green 
            $lan.RenewDHCPLease() | out-Null  
        Write-Host `n
        Write-Host "The New Ip Address is "$lan.IPAddress" with Subnet "$lan.IPSubnet"" -ForegroundColor Yellow  
    }

Get-DnsClientServerAddress
Exit-PSSession

}
#####***************************************************************#####
Function Netmotion-IPs () {


    Write-Host "`n Patrol Netmotion IPs as of 3/28/22" -ForegroundColor Magenta
    Write-Host "
     Location to look up Netmotion information live: 
     http://rdc-mobility-07.rrrdc.org:8080"

 
     Write-Host -NoNewLine `t`n "Netmotion Server Address:" -ForegroundColor Magenta
     Write-host -NoNewLine `t "165.234.255.24" `n -ForeGroundColor Green
     Write-Host `t `t `t `t   "156.99.242.173 (MN Server Address)" -ForegroundColor Yellow
 
     Write-Host `n 
     get-content -path "\\c9svr119v\Sandbox`$\scripts\NetmotionOfTheOcean.txt" 
     Write-Host `n 

<#
     Device Name : Netmotion Static Address : User Alias
     ---------------------------------------------------
     "

  Write-Host "Sgt/Command" -ForegroundColor Green
Write-Host -NoNewLine "C1010299	10.63.81.39	`t JahnerJ
C1010300	10.63.81.16	`t kroght
C1012473	10.63.81.37	`t vandeneindej - Unmarked" `n
     

     Write-Host "Regular Patrol" -ForegroundColor Green
Write-Host -NoNewLine "C1010301	10.63.81.25	`t kingm - Squad 63
C1010302	10.63.81.7	`t koerberj - Squad 74
C1010303	10.63.81.3	`t FRT 102 - hegerb
C1010304	10.63.81.5	`t HedinJ - Squad 45
C1010954	10.63.81.12	`t zundelk - Squad 47
C1010955	10.63.81.10	`t mortensonj - Squad 69 
C1010957	10.63.81.23	`t sassolundinp - Squad 62
C1010958	10.63.81.18	`t behmt - Squad 71
C1010959	10.63.81.19	`t hamesh - Squad 65
C1010962	10.63.81.1	`t murrayj/Stregeb/fletcherj - Squad 60
C1010965	10.63.81.24	`t boerboomn - Squad 66
C1010967	10.63.81.8	`t thompsonc - Squad 61 
C1011591	10.63.81.28	`t manningg - Squad 67
C1011592	10.63.81.27	`t thomsenc - Squad 70
C1012085	10.63.81.9	`t krauser - Squad 75
C1012086	10.63.81.30	`t nettestadl - Squad 76
C1012087	10.63.81.29	`t wiedenmanj - Squad 50
C1012088	10.63.81.36	`t murphyk - Squad 72
C1012474	10.63.81.20	`t beckiust - Squad 64
C1012476	10.63.81.22	`t longletj  - Squad 68
C1012475	10.63.81.2 	`t HedinJ  - Squad 45
C1012477	10.63.81.11	`t castlej - Squad 73
C1012478	10.63.81.26	`t kellerc - Squad 65 
C1013075	10.63.81.21	`t SassoLundinP - Squad 62 `n" `n 

     Write-Host "FRT" -ForegroundColor Green
Write-Host -NoNewLine "C1010298	10.63.81.13	`t FRT 103
C1010960	10.63.81.35	`t FRT 103
C1010961	10.63.81.17	`t FRT 104
C1010968	10.63.81.15	`t kindr FRT 101 
C1010550	10.63.81.38	`t FRT ?" `n

     Write-Host "SRO" -ForegroundColor Green 
Write-Host -NoNewLine "C1010966	10.63.81.31	`t agayevr - Squad ?
C1010956	10.63.81.4	`t scottj - Squad 87
C1010304	10.63.81.5 	`t crawfordj - Squad 84 
C1010964	10.63.81.6	`t hermannd - Squad 86" `n 

     Write-Host "`nStreet Crimes" -ForegroundColor Green
Write-Host "C1013071`t10.63.81.40	`t mcnamarat (Getac) 
C1013076	10.63.81.32	`t NitschkeB
C1013071	10.63.81.40	`t McNamaraT " `n

Write-Host "`nDecommissioned" -ForegroundColor Magenta
Write-Host "C1011095`t10.63.81.34	`t mcnamarat (Getac) 
C1010938	10.63.81.33	`t nitschkeb (Getac)
C1010963	10.63.81.14	`t crawfordj - Squad 84" `n
#>

}
Set-Alias Watch-CoF -Value Netmotion-IPs
Set-Alias Netmotion -Value Netmotion-IPs

#Get-Content -Path "\\c9svr119v\Sandbox`$\Scripts\NetmotionOfTheOcean.txt"
#####***************************************************************#####
##AD Lockout Suicide

Function Lockout-Suicide() {

    <#
    .SYNOPSIS
    This will poll every 30 seconds all of the locked out users in AD
    
    .DESCRIPTION
    This is a simple status script that will poll all the locked out users in AD. Showing the time and user name. Also saving a log to Sandbox/logs 
        
    .EXAMPLE
        PS C:\> Lockout-Suicide
        Transcript started, output file is \\c9svr119v\sandbox$\Logs\Lockout-Suicide-LDAP_2019.04.09-
        03.50.log
        [04/09/19 15:50:54] --> NO ONE is locked out! This may be a first
        [04/09/19 15:51:24] --> NO ONE is locked out! This may be a first
        [04/09/19 15:51:54] --> NO ONE is locked out! This may be a first
        Users that are locked: [04/09/19 15:52:24]
        CowleyC
        Users that are locked: [04/09/19 15:52:54]

    #>
    
function Start-BigBrother()
    {
    [CmdletBinding()]
        Param (
            [Parameter(Mandatory=$False)]        
              [string]$Name
             )

        ##Where you want to save the logs to
        $logFolder = "\\c9svr119v\sandbox`$\Logs\"
        #$logFolder = "C:\CassIT\Logs\"

        #Function Name/Descipt of function 
        #$funcdescript = "-$descript-"
        
        #change computer for whatever you may have for mandatory parameters or other distinguishable feature
        $NamedTranscript = "Lockout-Suicide"
                
        $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
        $ILogName = $NamedTranscript + "_" + $IDate + ".log"
        $ILog = $LogFolder + $ILogName
     
        #New-Item $LogFolder -ItemType Directory -ErrorAction SilentlyContinue -Force
     
            Start-Transcript -Path "$ILog" -NoClobber
     
    }
#$NameofScript = "LockoutSuicide"
Start-BigBrother 

$status = "Running"
$GrandmasterLevon = "Always" 


function Get-TimeStamp {
    
    return "[{0:MM/dd/yy} {0:hh:mm:ss tt}]" -f (Get-Date)
    
}


DO { 
    $backups = [array]$users = Search-ADAccount -LockedOut
    $countofback = $backups.Count
    $usernames = $backups.samaccountname


    #$backups
       #If the user count has more than one option - it will print out a menu and ask the user to make a choice
    
   
               if($countofback -ne 0){
                   Write-Host -ForegroundColor Green "Users that are locked:"  
   
                   For ($i=0;$i -lt $countofback; $i++){
                          

                       Write-Host -ForegroundColor Magenta "$(get-timestamp) --> $(($backups[$i]).SamAccountName)"      
                       }
   
            <#
                       Do {
                           $selection = Read-Host `n "Enter the number of the user for unlock in q to quit"  
                           If ($selection -NotLike "q*"){
                               $selection = $selection -as [int]
                               $DoThisUser = $backups[$selection]
                           }   
                   }
                   Until (($selection -lt $countofback -AND $selection -match "\d") -OR $selection -Like "q*")  
                   
            #>
           }


           #Print to screen and stop if no users are found   
               elseif ($countofback -lt 1) {
                   Write-Host " $(get-timestamp) --> NO ONE is locked out! This may be a first"  -ForegroundColor Red
                   #break
                   }
    
      <#
               #Stop if they hit q
               If ($selection -Like "q*") {  
                   Break  
                   }    
  
           $unlockme = ($DoThisUser).SamAccountName
           Unlock-User $unlockme
      #>
    Start-Sleep -Seconds 120
      }
 
  While ($GrandmasterLevon -eq "Always")  
    
 }   


Function LockoutLDAP-Suicide() {

    <#
    .SYNOPSIS
    This will poll every 30 seconds all of the locked out users in AD - if it discovers LDAP accounts locked it will autounlock them. 
    
    .DESCRIPTION
    This is a simple status script that will poll all the locked out users in AD. Showing the time and user name. If LDAP 1 or LDAP 2 are locked out it will automagically unlock them for you Also saving a log to Sandbox/logs 
        
    .EXAMPLE
    
    PS C:\> LockoutLDAP-Suicide
        Transcript started, output file is \\c9svr119v\sandbox$\Logs\Lockout-Suicide-LDAP_2019.04.09-
        03.49.log
        Users that are locked:
        [04/09/19 15:49:41] --> LDAP2
        Seriously WTF again - Unlocked LDAP2
        Users that are locked:
        [04/09/19 03:56:09] --> CowleyC
        Users that are locked:
        [04/09/19 03:56:39] --> CowleyC


    #>


    function Start-BigBrother()
    {
    [CmdletBinding()]
        Param (
            [Parameter(Mandatory=$False)]        
              [string]$Name
             )

        ##Where you want to save the logs to
        #$logFolder = "\\c9svr119v\sandbox`$\Logs\"
        #$logFolder = "C:\CassIT\Logs\"
        $logFolder = "E:\ServerLogs$\"

        #Function Name/Descipt of function 
        $funcdescript = "-$descript-"
        
        #change computer for whatever you may have for mandatory parameters or other distinguishable feature
        $NamedTranscript = "Lockout-Suicide-LDAP"
                
        $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
        $ILogName = $NamedTranscript + "_" + $IDate + ".log"
        $ILog = $LogFolder + $ILogName
     
        #New-Item $LogFolder -ItemType Directory -ErrorAction SilentlyContinue -Force
     
            Start-Transcript -Path "$ILog" -NoClobber
     
    }
    Start-BigBrother 


$status = "Running"
$GrandmasterLevon = "Always" 


function Get-TimeStamp {
    
    return "[{0:MM/dd/yy} {0:hh:mm:ss tt}]" -f (Get-Date)
    
}

DO { 
    $backups = [array]$users = Search-ADAccount -LockedOut
    $countofback = $backups.Count
    $usernames = $backups.samaccountname


    #If the user count has more than one option - it will print out a menu and ask the user to make a choice
   
    if($countofback -ne 0){
        Write-Host -ForegroundColor Green "Users that are locked:"  
   
        For ($i=0;$i -lt $countofback; $i++){
                          

            Write-Host -ForegroundColor Magenta "$(get-timestamp) --> $(($backups[$i]).SamAccountName)"      
            }

            if ($usernames -like "LDAP1*") {
                LockedOut-Location LDAP1
                Unlock-ADAccount LDAP1
                Write-Host "$(get-timestamp) --> Seriously WTF again - Unlocked LDAP1" -foregroundcolor yellow
            }

            if($usernames -like "LDAP2*") {
                LockedOut-Location LDAP2
                Unlock-AdAccount LDAP2
                Write-Host "$(get-timestamp) --> Seriously WTF again - Unlocked LDAP2" -foregroundcolor yellow
            }
   
    }


        #Print to screen and stop if no users are found  
         
        elseif ($countofback -lt 1) {
            Write-Host " $(get-timestamp) --> NO ONE is locked out! This may be a first"  -ForegroundColor Red
            }
    
      <#  
           $unlockme = ($DoThisUser).SamAccountName
           Unlock-User $unlockme
      #>

    Start-Sleep -Seconds 30
      }
 
  While ($GrandmasterLevon -eq "Always")  
    
 }   
#####***************************************************************#####
Function Server-Deets(){
$ArrComputers = (get-adcomputer -filter * -SearchBase "OU=Servers,OU=Cass County Servers,DC=co,DC=cass,DC=nd,DC=us").name
#$ArrComputers = "c9svr10","c9svr19","c9svr208","c9svr20","c9svr40","c9svr41","c9svr43","c9svr49","c9svr64","c9svr75","c9svr76","c9svr77","c9svr78","c9svr100","c9svr107","c9svr108","c9svr113","c9svr114","c9svr120","c9svr123","c9svr132","c9svr133","c9svr147","c9svr148","c9svr155","c9svr156","c9svr157","c9svr158","c9svr159","c9svr208"
#""
#$ArrComputers = "10.99.133.49" 
#Specify the list of PC names in the line above. "." means local system

#Clear-Host
    foreach ($Computer in $ArrComputers) 
    {



    Try {
        $testcomputer = Get-WmiObject Win32_ComputerSystem -Computer $computer -ErrorAction Stop
       
        $computerSystem = get-wmiobject Win32_ComputerSystem -Computer $Computer
        $computerBIOS = get-wmiobject Win32_BIOS -Computer $Computer
        $computerOS = get-wmiobject Win32_OperatingSystem -Computer $Computer
        $computerCPU = get-wmiobject Win32_Processor -Computer $Computer
        $computerHDD = Get-WmiObject Win32_LogicalDisk -ComputerName $Computer -Filter drivetype=3
        $computerIP = Test-Connection $computer -count 1 

            write-host "System Information for: " $computerSystem.Name -BackgroundColor DarkCyan
            "-------------------------------------------------------"
            "Manufacturer: " + $computerSystem.Manufacturer
            "Model: " + $computerSystem.Model
            "Serial Number: " + $computerBIOS.SerialNumber
            "CPU: " + $computerCPU.Name
            #"HDD Capacity: "  + "{0:N2}" -f ($computerHDD.Size/1GB) + "GB"
            #"HDD Space: " + "{0:P2}" -f ($computerHDD.FreeSpace/$computerHDD.Size) + " Free (" + "{0:N2}" -f ($computerHDD.FreeSpace/1GB) + "GB)"
            #"RAM: " + "{0:N2}" -f ($computerSystem.TotalPhysicalMemory/1GB) + "GB"
            #"Cores:"    + $computerCPU.numberofcores   
            #"Logical Processors:" + $computerCPU.numberoflogicalprocessors 
            "Operating System: " + $computerOS.caption + ", Service Pack: " + $computerOS.ServicePackMajorVersion
            "User logged In: " + $computerSystem.UserName
            "Last Reboot: " + $computerOS.ConvertToDateTime($computerOS.LastBootUpTime)
            "IP Address: " + $computerIP.IPV4address
            ""
            "-------------------------------------------------------"
    
    ################ Add That Shit to a Spreadsheet also
            $Object = [pscustomobject]@{
                Name = $computerSystem.Name
                Manufact = $computerSystem.Manufacturer
                Serial = $computerBIOS.SerialNumber
                Model = $computerSystem.Model
                CPU = $computerCPU.Name
                OS = $computerOS.caption + ", Service Pack: " + $computerOS.ServicePackMajorVersion
                IPAddress = $computerIP.IPV4address
                HDCapactity = "{0:N2}" -f ($computerHDD.Size/1GB) + "GB"
                RAM = "{0:N2}" -f ($computerSystem.TotalPhysicalMemory/1GB) + "GB"
                Cores = $computerCPU.numberofcores
                Processors = $computerCPU.numberoflogicalprocessors 
             }

            $Object | Export-Csv C:\CassIT\ServerDeets-v9.csv -Append -NoTypeInformation
  
  }
    
    Catch {
        #$computerIP = Test-Connection $computer -count 1
        #$ErrorActionPreference = Write-Host "Oops"

        #####Refine Error catch and fix the PIIING when a IP is not found 


        Write-Host "------------------------------------------------------- `n"
        Write-Host "Can't hit $computer - figure it out yo'self " -ForegroundColor Magenta 
        #Write-Host "PIIIIIIIIIIIIIIIIIIIIIIING..." $computerIP.IPV4address -ErrorAction SilentlyContinue -ForegroundColor Green
        Write-Host "------------------------------------------------------- `n"

        }

        
###############################################


################################################







#ForEach } Thingy
 }


        

   



}
   
#####***************************************************************#####
<#if IP entered is like 10.99. it looks on 89v
    $JailData = "10.99.144.0"
    $LECData = "10.99.150.0"
    $HighwayData = "10.99.168.0"


#if IP entered is like 10.99. it looks on 208
    $ITData = "10.99.130.0"
    $AnnexData = "10.99.160.0"
    $CourthouseData = "10.99.128.0"

Get-DHCPServerv4Lease -IPAddress $lookup -ComputerName $208DC |  FL -Property HostName,ServerIP,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType
#>

Function IPLook () {

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True)]        
        [string]$EntireIP
        )
    
    $lookup = $EntireIP
    $208DC = "c9svr208"
    $89vDC = "c9svr89v"
    #if IP entered is like 10.99. it looks on 89v
        $JailData = "10.99.14*"
        $LECData = "10.99.15*"
        $HighwayData = "10.99.168.*"
        $HighwayOther = "10.99.17*"

    #if IP entered is like 10.99. it looks on 208
        $ITData = "10.99.13*"
        $AnnexData = "10.99.160.*"
        $AnnexData2 = "10.99.161.*"
        $CourthouseData = "10.99.12*"
       
        $CourthouseServers = "10.99.133.*"
        #$CHSecurity = "10.99.135.*"
        #$CHManagement = "10.99.136.*"


    ###Run through 208
            if ($lookup -like $ITData ) {
                $thejunk = Get-DHCPServerv4Lease -IPAddress $lookup -ComputerName $208DC -ErrorAction SilentlyContinue #|  FL -Property HostName,ServerIP,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType
                try {
                    #Write-Output "`nInformation about entered IP Address" 
                    $thejunk |  FL -Property HostName,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType

                        #Get the Computer Name
                        $name = $thejunk.HostName
                        $yahyah = $name.split(".")
                        $yahyah45 = $yahyah[0]

                    Ferret-Out $yahyah45
                }
                catch {
                    Write-Output "IP Not found - sorry"
                }

                Return
            }

            if ($lookup -like $CourthouseServers ) {
                $thejunk = Get-DHCPServerv4Lease -IPAddress $lookup -ComputerName $208DC #|  FL -Property HostName,ServerIP,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType
                try {
                    #Write-Output "`nInformation about entered IP Address" 
                    $thejunk |  FL -Property HostName,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType

                        #Get the Computer Name
                        $name = $thejunk.HostName
                        $yahyah = $name.split(".")
                        $yahyah45 = $yahyah[0]

                    Ferret-Out $yahyah45
                }
                catch {
                    Write-Output "IP Not found - sorry"
                }

                Return
            }

            #Look at Annex Data
            if ($lookup -like $AnnexData ) {
                $thejunk = Get-DHCPServerv4Lease -IPAddress $lookup -ComputerName $208DC #|  FL -Property HostName,ServerIP,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType
                try {
                    #Write-Output "`nInformation about entered IP Address" 
                    $thejunk |  FL -Property HostName,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType

                        #Get the Computer Name
                        $name = $thejunk.HostName
                        $yahyah = $name.split(".")
                        $yahyah45 = $yahyah[0]

                    Ferret-Out $yahyah45
                }
                catch {
                    Write-Output "IP Not found - sorry"
                }

                Return
            }

            #Look at Annex Data2
            if ($lookup -like $AnnexData2 ) {
                $thejunk = Get-DHCPServerv4Lease -IPAddress $lookup -ComputerName $208DC #|  FL -Property HostName,ServerIP,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType
                try {
                    #Write-Output "`nInformation about entered IP Address" 
                    $thejunk |  FL -Property HostName,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType

                        #Get the Computer Name
                        $name = $thejunk.HostName
                        $yahyah = $name.split(".")
                        $yahyah45 = $yahyah[0]

                    Ferret-Out $yahyah45
                }
                catch {
                    Write-Output "IP Not found - sorry"
                }

                Return
            }

            #Look at Courthouse Data
            if ($lookup -like $CourthouseData ) {
                $thejunk = Get-DHCPServerv4Lease -IPAddress $lookup -ComputerName $208DC #|  FL -Property HostName,ServerIP,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType
                try {
                    #Write-Output "`nInformation about entered IP Address" 
                    $thejunk |  FL -Property HostName,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType

                        #Get the Computer Name
                        $name = $thejunk.HostName
                        $yahyah = $name.split(".")
                        $yahyah45 = $yahyah[0]

                    Ferret-Out $yahyah45
                }
                catch {
                    Write-Output "IP Not found - sorry"
                }

            Return
            }
        
    ##Run Through 89v
            #Look at Jail Data
            if ($lookup -like $JailData ) {
                $thejunk = Get-DHCPServerv4Lease -IPAddress $lookup -ComputerName $89vDC #|  FL -Property HostName,ServerIP,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType
                try {
                    #Write-Output "`nInformation about entered IP Address" 
                    $thejunk |  FL -Property HostName,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType

                        #Get the Computer Name
                        $name = $thejunk.HostName
                        $yahyah = $name.split(".")
                        $yahyah45 = $yahyah[0]

                    Ferret-Out $yahyah45
                }
                catch {
                    Write-Output "IP Not found - sorry"
                }

            Return
            }
            
            #Look at LEC Data
            if ($lookup -like $LECData ) {
                $thejunk = Get-DHCPServerv4Lease -IPAddress $lookup -ComputerName $89vDC #|  FL -Property HostName,ServerIP,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType
                try {
                    #Write-Output "`nInformation about entered IP Address" 
                    $thejunk |  FL -Property HostName,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType

                        #Get the Computer Name
                        $name = $thejunk.HostName
                        $yahyah = $name.split(".")
                        $yahyah45 = $yahyah[0]

                    Ferret-Out $yahyah45
                }
                catch {
                    Write-Output "IP Not found - sorry"
                }

            Return
            }
            
            #Look at Highway Data
            if ($lookup -like $HighwayData ) {
                $thejunk = Get-DHCPServerv4Lease -IPAddress $lookup -ComputerName $89vDC #|  FL -Property HostName,ServerIP,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType
                try {
                    #Write-Output "`nInformation about entered IP Address" 
                    $thejunk |  FL -Property HostName,IPAddress,ScopeID,AddressState,LeaseExpiryTime,ClientID,ClientType

                        #Get the Computer Name
                        $name = $thejunk.HostName
                        $yahyah = $name.split(".")
                        $yahyah45 = $yahyah[0]

                    Ferret-Out $yahyah45
                }
                catch {
                    Write-Output "IP Not found - sorry"
                }

            Return
            }
            
}

#####***************************************************************#####
##Unhandled Bullshit
Function NWUnhandled (){

#Start Transcript
        function Start-BigBrother()
        {
        [CmdletBinding()]
            Param (
                [Parameter(Mandatory=$True)]        
                [string]$Name,
                [Parameter(Mandatory=$False)]        
                [string]$Descript
                )

            ##Where you want to save the logs to
            #$logFolder = "\\c9svr119v\sandbox`$\Logs\"
            $logFolder = "C:\CassIT\Logs\"

            #Function Name/Descipt of function 
            #$funcdescript = "-$descript-"
            
            #change computer for whatever you may have for mandatory parameters or other distinguishable feature
            $NamedTranscript = "$Name" + $funcdescript
                    
            $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
            $ILogName = $NamedTranscript + "_" + $IDate + ".log"
            $ILog = $LogFolder + $ILogName
        
            #New-Item $LogFolder -ItemType Directory -ErrorAction SilentlyContinue -Force
        
                Start-Transcript -Path "$ILog" -NoClobber
        
        }
        $ComputerUser = $env:USERNAME
        $NameofScript = $ComputerUser + "-NW-Unhandled-Exception-Push"
        Start-BigBrother -Name $NameofScript

<#Remote Session into device
    $computer = Read-Host "Please enter a computer name" 
     
    #        $computer = Read-Host "Please enter a computer name"  
        
            $usershit = Read-Host "`nEnter Servicedesk or First Initial/Last Name Acct?"
            $Domain = $env:USERDOMAIN
            $WithDomain = get-credential -Message "?" -User $DOMAIN\$usershit 


            Write-Host "Don't forget to close the window or hit exit when done" -ForegroundColor Red
            Enter-PSSession -ComputerName $computer -Credential $WithDomain
#>    

#    BustIn-Backdoor $computer


##Stop Service
    Stop-Service -displayname 'New World Updater'
##Delete Reg Folder
    Remove-Item 'C:\ProgramData\New World Systems\New World Updater\registry\' -Recurse -Force


## Delete Police Client and ORI Folder/Files in Program Data/Applications Folder

    #Police Client 
    #"C:\ProgramData\New World Systems\New World Updater\applications\Police Client"
        Remove-Item 'C:\ProgramData\New World Systems\New World Updater\applications\Police Client\' -Recurse -Force
    #ORI
    #"C:\ProgramData\New World Systems\New World Updater\applications\ND0090000"
        Remove-Item 'C:\ProgramData\New World Systems\New World Updater\applications\ND0090000\' -Recurse -Force


## Delete Police Client and ORI Folder/Files in Program Data/Downloader Folder
    
    #Police Client
    #"C:\ProgramData\New World Systems\New World Updater\downloader\Police Client"
        Remove-Item 'C:\ProgramData\New World Systems\New World Updater\downloader\Police Client\' -Recurse -Force
    #ORI
    #"C:\ProgramData\New World Systems\New World Updater\downloader\ND0090000"
        Remove-Item 'C:\ProgramData\New World Systems\New World Updater\downloader\ND0090000\' -Recurse -Force

##Delete Police Client Folder in Program Data/MSI Cache

    #Police Client
    #"C:\ProgramData\New World Systems\New World Updater\MsiCache\Police Client"
        Remove-Item 'C:\ProgramData\New World Systems\New World Updater\MsiCache\Police Client\' -Recurse -Force

##Uninstall Law Enforcement Application from Programs and Features

       Invoke-Expression("msiexec.exe /x '{bf63d247-a0df-4310-ab22-83b4d45171a7}' REBOOT=ReallySuppress /q")

###Restart Service 
    Start-Service -DisplayName 'New World Updater'

}
#####***************************************************************#####
FUnction Toasty-Smalls(){

    [CmdletBinding()]
    Param(
         [Parameter(Mandatory=$True)]        
           [string]$PC,
           [Parameter(Mandatory=$True)]        
           [string]$dude,
           [Parameter(Mandatory=$True)]        
           [string]$msg
           )

$Sender = $dude
$Message = $msg
$RemoteComputer = $pc

Function New-ToastNotification {
    Param($Sender,$Message)

    # Required parameters
    $AudioSource = "ms-winsoundevent:Notification.Default"
    $HeaderFormat = "ImageOnly" # Choose from "TitleOnly", "ImageOnly" or "ImageAndTitle"
    $Base64Image = "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"

    # Create an image file from base64 string and save to user temp location
    If ($Base64Image)
    {
        $ImageFile = "C:\CassIT\ToastLogo.png"

        [byte[]]$Bytes = [convert]::FromBase64String($Base64Image)
        [System.IO.File]::WriteAllBytes($ImageFile,$Bytes)
    }
 
    # Load some required namespaces
    $null = [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]
    $null = [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime]

    # Register the AppID in the registry for use with the Action Center, if required
    $app =  '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
    $AppID = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\\WindowsPowerShell\\v1.0\\powershell.exe"
    $RegPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings'

    if (!(Test-Path -Path "$RegPath\$AppId")) {
        $null = New-Item -Path "$RegPath\$AppId" -Force
        $null = New-ItemProperty -Path "$RegPath\$AppId" -Name 'ShowInActionCenter' -Value 1 -PropertyType 'DWORD'
    }

# Define the toast notification in XML format
[xml]$ToastTemplate = @"
<toast duration="long">
    <visual>
    <binding template="ToastGeneric">
        <text>$Sender</text> 
        <image placement="appLogoOverride" hint-crop="circle" src="$ImageFile"/>    
        <group>
            <subgroup>
                <text hint-style="title" hint-wrap="true" >$Message</text>
            </subgroup>
        </group>
    </binding>
    </visual>
    <audio src="$AudioSource"/>
</toast>
"@

    # Load the notification into the required format
    $ToastXml = New-Object -TypeName Windows.Data.Xml.Dom.XmlDocument
    $ToastXml.LoadXml($ToastTemplate.OuterXml)

    # Display
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($app).Show($ToastXml)
}

Invoke-Command -ComputerName $RemoteComputer -ScriptBlock ${function:New-ToastNotification} -ArgumentList $Sender,$Message

}
#####***************************************************************#####
Function Build-Toast() {

## Displays a Windows 10 Toast Notification for a ConfigMgr Application deployment
## To be used in a compliance item
$IDate = Get-Date -Format yyyy.MM.dd-hh.mm
$stuff = "Toasty Hotness" + $Idate
New-Item -Path "C:\CassIT\Logs" -Name $stuff -ItemType "file" -Value "Trying to fix this CI."
## References
# Options for audio: https://docs.microsoft.com/en-us/uwp/schemas/tiles/toastschema/element-audio#attributes-and-elements
# Toast content schema: https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/toast-schema
# Datetime format for deadline: Ref: https://msdn.microsoft.com/en-us/library/system.datetime(v=vs.110).aspx
function Start-BigBrother()
    {
    [CmdletBinding()]
        Param (
            [Parameter(Mandatory=$True)]        
              [string]$Name,
            [Parameter(Mandatory=$False)]        
              [string]$Descript
             )

        ##Where you want to save the logs to
        $logFolder = "\\c9svr119v\sandbox`$\Logs\"
        #$logFolder = "C:\CassIT\Logs\"

        #Function Name/Descipt of function 
        #$funcdescript = "-$descript-"
        
        #change computer for whatever you may have for mandatory parameters or other distinguishable feature
        $NamedTranscript = "$Name" + $funcdescript
                
        $IDate = Get-Date -Format yyyy.MM.dd-hh.mm
        $ILogName = $NamedTranscript + "_" + $IDate + ".log"
        $ILog = $LogFolder + $ILogName
     
        #New-Item $LogFolder -ItemType Directory -ErrorAction SilentlyContinue -Force
     
            Start-Transcript -Path "$ILog" -NoClobber
     
    }
Start-BigBrother -Name "ToastyHotnessRemediation"

Function Start-OSD() {
    # Find OSD Task Sequence
    $OSDName = "Build Upgrade - 1903"
    $CIMClass = (Get-CimClass -Namespace root\ccm\clientsdk -ClassName CCM_ProgramsManager)
    $OSD = (Get-CimInstance -ClassName CCM_Program -Namespace "root\ccm\clientSDK" | Where-Object {$_.Name -like "$OSDName"})

    # Set arguments to call 
    $Args = @{PackageID = $OSD.PackageID
    ProgramID = $OSD.ProgramID}

    Invoke-CimMethod -CimClass $CIMClass -MethodName "ExecuteProgram" –Arguments $Args
}
#$launchIt = "" 

# Required parameters
$Title = "Upgrade is ready to install"
$ITdept = "Your Company Information Technology"
$SoftwarecenterShortcut = "softwarecenter:page=OSD"
$AudioSource = "ms-winsoundevent:Notification.Default"


$Title = "Windows Upgrade is Overdue!"
#$SoftwarecenterShortcut= "softwarecenter:SoftwareID=ScopeId_8E25450A-4C7E-4508-B501-B3F0E2C91541/Application_abd1dcbe-275a-4be1-9800-1c1e9a0ce7ff"
$AudioSource = "ms-winsoundevent:Notification.Default"
$SubtitleText = "Questions Email: Servicedesk@casscountynd.gov"
#$BodyText = "This upgrade may take up to 2 hours and cannot be stopped once started. Please do not attempt to reboot your device or disconnect it from the internet. After the upgrade is started you will not need to do anything and the device will return to the login screen when complete `n"
$HeaderFormat = "ImageOnly" # Choose from "TitleOnly", "ImageOnly" or "ImageAndTitle"
#$date =  (Get-Date).Subtract( -DisplayHint Date
$i = "10"

$stuff = "03/01/2020"
[datetime]$mydate = $stuff
$Deadline = $mydate.AddDays($i)

$BodyText = "Please Note: `n -This upgrade may take up to 2 Hours `n -Upgrade cannot be stopped `n -Do NOT reboot or unplug any cables `n -When complete device will return to login screen `n"



# Optional parameters
# Base64 string for an image, see Images section below to create the string
$Base64Image = "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"
# Deployment deadline
#[datetime]$Deadline = "21 June 2018 15:00"


# Calculated parameters
        If ($Deadline)
        {
            $TimeSpan = $Deadline - [datetime]::Now
        }

## Images
            # Convert an image file to base64 string
            <#
            $File = "C:\Users\tjones\Pictures\ICON_EV_LOGO_Resized.png"
            $Image = [System.Drawing.Image]::FromFile($File)
            $MemoryStream = New-Object System.IO.MemoryStream
            $Image.Save($MemoryStream, $Image.RawFormat)
            [System.Byte[]]$Bytes = $MemoryStream.ToArray()
            $Base64 = [System.Convert]::ToBase64String($Bytes)
            $Image.Dispose()
            $MemoryStream.Dispose()
            $Base64 | out-file "C:\Users\tjones\Pictures\ICON_EV_LOGO_Resized.txt" # Save to text file, copy and paste from there to the $Base64Image variable
            #>

# Create an image file from base64 string and save to user temp location
If ($Base64Image)
{
    $ImageFile = "$env:TEMP\ToastLogo.png"
    [byte[]]$Bytes = [convert]::FromBase64String($Base64Image)
    [System.IO.File]::WriteAllBytes($ImageFile,$Bytes)
}
 
# Load some required namespaces
$null = [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]
$null = [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime]

# Register the AppID in the registry for use with the Action Center, if required
$app =  '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
$AppID = "{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\\WindowsPowerShell\\v1.0\\powershell.exe"
$RegPath = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings'

if (!(Test-Path -Path "$RegPath\$AppId")) {
    $null = New-Item -Path "$RegPath\$AppId" -Force
    $null = New-ItemProperty -Path "$RegPath\$AppId" -Name 'ShowInActionCenter' -Value 1 -PropertyType 'DWORD'
}


# Define the toast notification in XML format
[xml]$ToastTemplate = @"
<toast scenario="reminder">
    <visual>
    <binding template="ToastGeneric">
        <text>Windows Upgrade is Overdue!</text>
        <text placement="attribution">Cass County IT Dept</text>        
        <group>
            <subgroup>
                <text hint-style="title"  hint-wrap="false" >$Title</text>
            </subgroup>
        </group>
        <group>          
            <subgroup>     
                <text hint-style="body" hint-wrap="false" >$BodyText</text>
            </subgroup>
        </group>
        <group>
            <subgroup>     
                <text hint-style="body" hint-wrap="false" >$SubtitleText</text>
            </subgroup>
        </group>
        <subgroup>     
        <text hint-style="body" hint-wrap="true" >Deadline: $Deadline</text>
    </subgroup>
    </binding>
    </visual>
    <actions>
      <action content="Take Action Now" activationType="protocol" arguments="$softwarecentershortcut" />
      <action content="Remind me later..." arguments="" />
    </actions>
    <audio src="$AudioSource"/>
</toast>
"@

# Change up the headers as required
If ($HeaderFormat -eq "TitleOnly")
{
    $ToastTemplate.toast.visual.binding.group[0].subgroup.InnerXml = "<text hint-style=""title"" hint-align=""center_horizonal"" hint-wrap=""true"" >$Title</text>"
}
If ($HeaderFormat -eq "ImageOnly")
{
    $ToastTemplate.toast.visual.binding.group[0].subgroup.InnerXml = "<image src=""$ImageFile""/>"
}
If ($HeaderFormat -eq "ImageAndTitle")
{
    $ToastTemplate.toast.visual.binding.group[0].subgroup.InnerXml = "<text hint-style=""title"" hint-wrap=""true"" >$Title</text><image src=""$ImageFile""/>"
}

# Add a deadline if required
If ($Deadline)
{
$DeadlineGroups = @"
        <group>
            <subgroup>
                <text hint-style="base" hint-align="left">Deadline</text>
                 <text hint-style="caption" hint-align="left">$(Get-Date -Date $Deadline -Format "dd MMMM yyy")</text>
            </subgroup>
            <subgroup>
                <text hint-style="base" hint-align="right">Time Remaining  </text>
                <text hint-style="caption" hint-align="right">$($TimeSpan.Days) days $($TimeSpan.Hours) hours </text>
            </subgroup>
        </group>
"@
    $ToastTemplate.toast.visual.binding.InnerXml = $ToastTemplate.toast.visual.binding.InnerXml + $DeadlineGroups

}

# Load the notification into the required format
$ToastXml = New-Object -TypeName Windows.Data.Xml.Dom.XmlDocument
$ToastXml.LoadXml($ToastTemplate.OuterXml)

# Display
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($app).Show($ToastXml)

Write-Host $Deadline  #ben
Write-Host "I ran on the device in some way shape or form"
Stop-Transcript
}
#####***************************************************************#####
Function Everbridge-Export() {
$OUpath = "OU=Users,OU=Internal,OU=Cass County,DC=co,DC=cass,DC=nd,DC=us"
$ExportPath = 'c:\CassIT\CCUsers-All-030520.csv'
Get-ADUser -Filter * -SearchBase $OUpath -Properties GivenName,Surname,UserPrincipalName,Department,MobilePhone,WhenCreated | Select-Object GivenName,Surname,UserPrincipalName,Department,MobilePhone,WhenCreated | Export-Csv -NoType $ExportPath
}
<#
 $name = "JahnerJ"
 Get-ADuser -Filter "Name -like '*$Name*'" -SearchBase $OUpath -Properties * GivenName,Surname,UserPrincipalName,Department | Select-Object GivenName,Surname,UserPrincipalName,Department
 #>
#####***************************************************************#####
Function SharePoint-Module() {

<#
    .SYNOPSIS
     When Sharepoint Online Commands are needed - this will load the module and then ask for credentials authorized to run tasks with SharePoint online. As a final step it runs a check on the user that is logging in - if that fails you aren't connected and working 
    
    .EXAMPLE
     SharePoint-Module
        Enter the full email address of a SharePoint administrator account: rottc@casscountynd.gov

         <Prompts for password>

        DisplayName : Rott, Cassie
        LoginName   : rottc@casscountynd.gov
        IsSiteAdmin : True
        IsGroup     : False
        Groups      : {Building Maintenance Owners, Information Technology Members, Limited Access System Group,
                    SharingLinks.1349c0c2-0c4a-44e1-85c6-e5b9905b7199.OrganizationEdit.f55cc4a1-f1c1-4654-860b-d00b7beb1125...}
        UserType    : Member
            
    .DESCRIPTION
     Use this when you need to get into SharePoint online via PowerShell - installs module and gets appropriate credentials.
#>

    Install-Module -Name Microsoft.Online.SharePoint.PowerShell -SkipPublisherCheck -AllowClobber

        $SPadminUPN= Read-host "Enter the full email address of a SharePoint administrator account"
        $orgName="casscounty" 
        $userCredential = Get-Credential -UserName $SPadminUPN -Message "Type the password." 

    Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential

    #Display the user logging in 
    Get-SPOUser -Site https://casscounty.sharepoint.com -loginname $SPadminUPN | Select-Object *

}

Function Exchange-Module() {

    $ExchangeAdmin = Read-Host "Enter the full email address of an Exchange Admin Account"
    $XChngSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/PowerShell-LiveID/ -Credential $ExchangeAdmin -Authentication Basic -AllowRedirection

    Import-PSSession $XChngSession
}

Function MSOL-Module() {
    Import-Module MSOnline

    $azureadminUPN= Read-host "Enter the full email address of a Azure administrator account"
    $msolcred = get-credential -UserName $azureadminUPN -Message "Type the password."
    Connect-msolservice -credential $msolcred

    get-msoluser -UserPrincipalName $azureadminUPN
}

Function Lync-Module() {
    Import-Module LyncOnlineConnector

    $LyncCreds = Read-Host "Enter the full email address of a Lync Admin Account"
    $LiveCred = Get-Credential -UserName $LyncCreds #-Message "Type Password"
    $CSSession = New-CsOnlineSession -credential $LiveCred 
    Import-PSSession $CSSession -Allowclobber

}


###Teams bridges Skype, Exchange and Teams -- did we went to import those also. Maybe yes or no question...
Function Teams-Module() {
    if (Get-Module -ListAvailable -Name MicrosoftTeams) {
        Write-Host "Module exists"
    }
    else {
        Write-Host "Module does not exist"
        Install-Module -Name MicrosoftTeams -Force
        Import-Module -Name MicrosoftTeams -Force
    }

    $TeamsAdmin = Read-Host "Enter Full Email Address of Admin Account"
    $TeamsCred = Get-Credential -UserName $TeamsAdmin -Message "Type Password"

    Connect-MicrosoftTeams -credential $TeamsCred
    Get-Team -User $TeamsAdmin
}

#########
Function ComplianceCenter-Module() {

 <#############
    .Description
        # New Compliance Search:
        # Not  quite sure how this works yet - I've usually gone into the UI to create the searches. 
        # It's more work, but not having command of the MS query syntax for search is why.
        #   https://docs.microsoft.com/en-us/powershell/module/exchange/policy-and-compliance-content-search/new-compliancesearch?view=exchange-ps
                New-ComplianceSearch -Name "<search name>" -ExchangeLocation "Research Department" -ContentMatchQuery "'Patent' AND 'Project Tailspin Toys'"


        # Checking the status & results of a Search"
                Get-ComplianceSearch -Identity "<search name>" | fl

        # other fun ways:
                $items =  (Get-ComplianceSearch -Identity "<search name>").Items

        # Check Compliance Actions:
                Get-ComplianceSearchAction | where {$_.SearchName -eq "<search name>"}

        # Delete the results from a Compliance Search:

        # Soft Delete (removes to Deletions folder in Recoverable Items):
            https://docs.microsoft.com/en-us/powershell/module/exchange/policy-and-compliance-content-search/new-compliancesearchaction?view=exchange-ps
                New-ComplianceSearchAction -SearchName "<search name>" -Purge -PurgeType SoftDelete

        # Hard Delete:
            # In theory this should also work, but it's dangerous AF:
                Get-Mailbox | Search-mailbox -SearchQuery 'Subject:"<email subject>"' -DeleteContent

        # Export Content:
            # TODO
                # I have the code for this, from the last time we went through this mess for eDiscovery. 
                # I just have to dig it up out of the archives. 
#>

    $UserCredential = Get-Credential 
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid -Credential $UserCredential -Authentication Basic -AllowRedirection 
    
    Import-PSSession $Session -AllowClobber -DisableNameChecking 
    $Host.UI.RawUI.WindowTitle = $UserCredential.UserName + " (Office 365 Security & Compliance Center)" 

}





#Check if SCCM is installed on computer (required for functions that connect to SCCM/MECM)
Function CheckSCCM
{
    if (Test-Path "C:\Program Files (x86)\Microsoft Endpoint Manager")
    {Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1"}
    else
    {
        Write-host "Please install SCCM/MECM before continuing with this function."
    }
}

#Remove PC from ADUC/SCCM
Function PCPurge()
{
	#ask user for computer to purge
    [CmdletBinding()]
    Param(
         [Parameter(Mandatory=$True)]        
           [string]$Computer
           )


	#checks if SCCM is installed prior to running this script
	CheckSCCM
    #purge the PC
    Try
	{
		Set-Location 'SC5:'
        #Search for the computer in AD based on user input, if nothing is found jump to Catch block
        Get-ADComputer $Computer -ErrorAction Stop
        #Computer found, tell user that it exists and display information on it from AD
        Write-Host -Foregroundcolor Green "Computer exists in ADDS!"
            $ComputerInfo = Get-ADComputer -Filter "Name -like '*$Computer*'" -Properties Name,Description,CanonicalName |
            Select-Object -Property @(
                'Name'
                'Description'
                'CanonicalName'
                @{ N = 'IPAddress'
            E = {(Resolve-DnsName -Name $_.Name).IPAddress}}
            )
            $ComputerInfo | Format-Table -Property Name,Description,IPAddress,CanonicalName -AutoSize -Wrap
            #Prompt for decision about deleting computer
            Write-Host -ForegroundColor Yellow "Are you absolutely sure you want to purge this PC from ADDS and SCCM?"
            $Choice = Read-Host "Yes or No? y/n"
            If ($Choice -eq "y")
            {
                #Delete from AD
                Get-ADComputer $Computer | Remove-ADObject -Recursive -Confirm:$false
                #Attempt delete from SCCM, if it fails jump to Catch block
                Try
                {
                    Remove-CMDevice -DeviceName $Computer -Force -ErrorAction Stop
                }
                Catch
                {
                    Write-Host -ForegroundColor Yellow "Computer doesn't exist in SCCM."
                }
                Finally
                {
                    Set-Location C:\
                }
                Break
            }
            else 
            {
                Write-Host -ForegroundColor Red "Fine. Exiting script."
            }
    }
    Catch
    {
        Write-Host -Foregroundcolor Red "Computer doesn't exist in AD. Deleting device out of SCCM..."
        Try
        {
            Remove-CMDevice -DeviceName $Computer -Force -ErrorAction Stop
        }
        Catch
        {
            Write-Host -ForegroundColor Yellow "Computer doesn't exist in SCCM."
        }
    }
    Finally
    {
        Set-Location C:\
    }
}

#Creates a list of computers from SCCM collections
Function Get-CollectionCSV 
{
    # Prompts user for a search item
    param([Parameter(Position=0)]$SearchItem)
    if (!$SearchItem) {
        $SearchItem = Read-Host -Prompt "Please enter a collection you would like to export to a .csv"
    }

    <#
    Param
    (
        [Parameter(Mandatory=$True)]        
        [string]$SearchItem
    )
    #>

	#check if SCCM is installed prior to running this script
	CheckSCCM

    # Sets location to SC5
    Set-Location 'SC5:'

    #Path to export CSV files to 
    $ExportPath = "C:\CassIT\"

    # Stores search result from previous input by user into $Search
    $Search = Get-CMDeviceCollection -name "*$SearchItem*"
    # Lists names of collections found
    $SearchCollected = $Search.name
    # Lists collection IDs from collections found
    $SearchID = $Search.CollectionID
    # Counts how many collections were found
    $SearchCount = $Search.count
    # Count how many members are in the collection
    $SearchMembers = $Search.membercount

    If($SearchCount -gt 1)
    {
        Write-Host -ForegroundColor Magenta "Collections that are similar to $($SearchItem):"  

        For ($i=0;$i -lt $SearchCount; $i++)
        {
            #### Trying to add Member Count 
            Write-Host -ForegroundColor Yellow "$($i): $(($SearchCollected[$i]); )"  -NoNewline 
            Write-Host -ForegroundColor Cyan ""  ""Member Count: "$(($SearchMembers[$i]))"

        }

            Do { 
                $Selection = Read-Host "Enter the number of the collection you want (a for all listed)" 
                If ($Selection -eq "a")
                {
                    Write-Host "You chose all listed collections"

                    $Array = @($SearchCollected)

                    Write-Host -ForegroundColor Yellow $Array | Format-List

                    $YesOrNo = Read-Host "Do you want to create CSVs of all the collections? y/n" 

                    If ($YesOrNo -ne "y")
                    {
                        Write-Host "What was the point of typing a then?"
                        exit
                    }
                    If ($YesOrNo -eq "y")
                    {
                        Write-Host "Exporting all listed collections. Please wait."
                        ForEach ($arr in $array)
                        {
                            $SearchStr = $Arr
                            $FoundColl = Get-CMCollection -Name $SearchStr | Get-CMCollectionMember | select name
                            ForEach ($Computer in $FoundColl) 
                            {
                                If ($FoundColl.count -ne 0)
                                {
                                    $namedjunk = $Computer.name 
                                    Get-ADComputer -Filter "Name -like '*$namedjunk'" -Properties Name,Description,CanonicalName | select name,description,canonicalname | Export-Csv -Path "C:\CassIT\$SearchStr.csv" -NoTypeInformation -Append
                                }
                                else
                                {
                                    Write-Host "No members found in $FoundColl. Moving on..."
                                }
                            }
                        }

                    }       
                }     
                ElseIf ($Selection -NotLike "n*")
                {
                    $selection = $selection -as [int]
                    $SearchStr = $SearchCollected[$Selection]
                    $FoundColl = Get-CMCollection -Name $SearchStr | Get-CMCollectionMember | select name
                    ForEach ($Computer in $FoundColl) 
                    {
                        $namedjunk = $Computer.name 
                        Get-ADComputer -Filter "Name -like '*$namedjunk'" -Properties Name,Description,CanonicalName | select name,description,canonicalname | Export-Csv -Path "C:\CassIT\$SearchStr.csv" -NoTypeInformation -Append
                    }
                    Write-Host "CSV created - C:\CassIT\$SearchStr.csv"
            
                }   
            }
        
            Until ((($Selection -lt $SearchCount -AND $Selection -match "\d") -OR $Selection -Like "q*") -OR $Selection -Like "a")
    }
    ElseIf($SearchCount -eq 1)
    {
        Write-Host "One collection found, creating CSV in C:\CassIT..."
        $SearchStr = $Search.name
        $FoundColl = Get-CMCollection -Name $SearchStr | Get-CMCollectionMember | select name
        ForEach ($Computer in $FoundColl) 
        {
            $namedjunk = $Computer.name 
            Get-ADComputer -Filter "Name -like '*$namedjunk'" -Properties Name,Description,CanonicalName | select name,description,canonicalname | Export-Csv -Path "C:\CassIT\$SearchStr.csv" -NoTypeInformation -Append
        }
        Write-Host "CSV created - C:\CassIT\$SearchStr.csv"
    }



    # Print and stop if nothing is found

    elseif ($SearchCount -lt 1) 
    {
        Write-Host "$SearchItem not found. Check the spelling of the collection or make sure it actually exists." -ForegroundColor Red
        Break        
    }
    Write-Host -ForegroundColor Red "If you ran this script twice on the same collection without moving the resulting file, you will have duplicates in the .csv. Check for accuracy."
    Write-Host -ForegroundColor Green "End of script. Check your C:\CassIT folder."
    Set-Location C:\
}

Function Get-ADComputers 
{
    Get-ADComputer -Filter "Name -like 'c10*'" -Properties Name,Description,CanonicalName | select name,description,canonicalname | Export-Csv -Path "C:\CassIT\ADComputers.csv" -NoTypeInformation -Append
    Write-Host -ForegroundColor Green "List in C:\CassIT"
}

#Commented out due to move to Admin jumpboxes
<#Function Start-Everything
{
    Get-Credential -Credential CASSCOUNTY\$env:USERNAME
    #RSAT
    if (Test-Path -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Active Directory Users and Computers.lnk")
    {
        Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Active Directory Users and Computers.lnk"
        Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\dhcp.lnk"
    }
    #SCCM
    if (Test-Path -Path "C:\Program Files (x86)\Microsoft Endpoint Manager\AdminConsole\bin\Microsoft.ConfigurationManagement.exe")
    {
        Start-Process "C:\Program Files (x86)\Microsoft Endpoint Manager\AdminConsole\bin\Microsoft.ConfigurationManagement.exe"
        Start-Process "C:\Program Files (x86)\Microsoft Endpoint Manager\AdminConsole\bin\Cireson\RemoteManage\ConfigMgrClientTools.exe"
    }
    #Powertoys
    if (Test-Path -Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PowerToys (Preview)\PowerToys (Preview).lnk")
    {
        Start-Process "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PowerToys (Preview)\PowerToys (Preview).lnk"
    }
}#>

#Deletes all profiles on a machine
Function Remove-AllProfiles 
{
    
    #Get computer number
    [CmdletBinding()]
    Param ([Parameter(Mandatory=$True)][string]$computer)
    
    #Test computer connection
    If ($computer -ne $Env:Computername) 
    {  
        If (!(Test-Connection -comp $computer -count 1 -quiet)) 
        {  
            Write-Warning "$computer is not accessible, please try a different computer or verify it is powered on."  
            Break  
        }  
    }

    #Gather all of the user profiles on computer into array
    Try 
    {  
        [array]$users = Get-WmiObject -ComputerName $computer Win32_UserProfile -filter "LocalPath Like 'C:\\Users\\%'" -ea stop  
    }  
    Catch 
    {  
        Write-Warning "$($error[0]) "  
        Break  
    }      

    #Check if array is empty
    if ($users.count -lt 1)
    {
        Write-Host -foregroundColor Yellow "No user profiles on machine. Exiting script."
        Break
    }

    #Cache the number of users  
    $num_users = $users.count 
    $account = 0
        
    #Begin iterating through all of the accounts to display
    Write-Host -ForegroundColor Green "User profiles on $($computer):"  
    For ($i=0;$i -lt $num_users; $i++) 
    {  
        Write-Host -ForegroundColor Green "$($i): $(($users[$i].localpath).replace('C:\Users\',''))"  
    }

    #Ask if they want to proceed with deletion
    Write-Host -foregroundColor red "PAY ATTENTION TO THE BELOW"
    $answer = Read-Host "Are you sure you want to wipe ALL profiles on $($computer)? Press 'y' to proceed"

    #Check if answer is y
    if ($answer -ne "y")
    {
        Write-Host "Exiting script."
        Break
    }

    #Delete profiles on specified computer
    while ($account -lt $num_users)
    {
        #Show profile to delete
        Write-Host -ForegroundColor Yellow "Deleting profile: $(($users[$account].localpath).replace('C:\Users\',''))"  
        
        #Remove the local profile  
        ($users[$account]).Delete()  
        Write-Host -ForegroundColor Magenta "Profile:  $(($users[$account].localpath).replace('C:\Users\','')) has been deleted"

        #Increment $account
        $account++
    }

    Write-Host "All profiles deleted. End of script."
}

#Removes all devices from a collection
Function Remove-Members
{
    # Prompts user for a search item
    param([Parameter(Position=0)]$SearchItem)
    if (!$SearchItem) {
        $SearchItem = Read-Host -Prompt "Please enter a collection you would like to clear"
    }
    # Import real fun SCCM stuff
    Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1"
    # Specify SCCM SiteCode
    [String]$SiteCode = "SC5"
    # Sets location to SC5
    Set-Location "$SiteCode`:"
    # Stores search result from previous input by user into $Search
    $Search = Get-CMDeviceCollection -name "*$SearchItem*"
    # Lists names of collections found
    $SearchCollected = $Search.name
    # Counts how many collections were found
    $SearchCount = $Search.count
    # Count how many members are in the collection
    $SearchMembers = $Search.membercount

    # Remove all devices from specified collection

    If ($SearchCount -gt 1)
    {
        Write-Host -ForegroundColor Magenta "Collections that are similar to $($SearchItem):"  

        For ($i=0;$i -lt $SearchCount; $i++)
        {
            #### Trying to add Member Count 
            Write-Host -ForegroundColor Yellow "$($i): $(($SearchCollected[$i]); )"  -NoNewline 
            Write-Host -ForegroundColor Cyan ""  ""Member Count: "$(($SearchMembers[$i]))"
        }
            $Selection = Read-Host "Enter the number of the collection you want to clear, or q to quit"

            If ($Selection -NotLike "q*")
            {
                Write-Host -ForeGroundColor Yellow "Clearing collection of all members..."
                $selection = $selection -as [int]
                $SearchStr = $SearchCollected[$Selection]
                Try
                {
                    Remove-CMDeviceCollectionDirectMembershipRule -CollectionName $SearchStr -ResourceName * -Force
                    Write-Host -ForegroundColor Green "Command succeeded. Wait for SCCM to catch up."
                }
                Catch
                {
                    Write-Host -ForegroundColor Red "Failed, for some reason. Oops."
                }
            }
            elseIf ($Selection -eq "q*")
            {
                Write-Host -ForegroundColor Red "Please enter an integer or q to quit."
            }
    }
    ElseIf($SearchCount -eq 1)
    {
        Write-Host -ForegroundColor Yellow "One collection found, clearing collection..."
        $SearchStr = $Search.name
        Try
        {
            Remove-CMDeviceCollectionDirectMembershipRule -CollectionName $SearchStr -ResourceName * -Force
            Write-Host -ForegroundColor Green "Command succeeded. Wait for SCCM to catch up."
        }
        Catch
        {
            Write-Host -ForegroundColor Red "Failed, for some reason. Oops."
        }    
    }
    Else
    {
        Write-Host -ForegroundColor Red "Collection not found. Try again."
    }
    Set-Location C:\
}

#Returns model of specified PC #
Function Get-Model 
{
    
    #Get computer number
    [CmdletBinding()]
    Param ([Parameter(Mandatory=$True)][string]$computer)

    #Display model
    Get-WmiObject -class Win32_ComputerSystem -computername $computer | Format-List -Property Manufacturer,Model,Name
    
    #Print Ferret-Out
    $ComputerInfo = Get-ADComputer -Filter "Name -like '*$Computer*'" -Properties Name,Description,CanonicalName |
            Select-Object -Property @(
                'Name'
                'Description'
                'CanonicalName'
                @{ N = 'IPAddress'
            E = {(Resolve-DnsName -Name $_.Name).IPAddress}}
            )
            $ComputerInfo | Format-Table -Property Name,Description,IPAddress,CanonicalName -AutoSize -Wrap
}

#Returns Windows build
Function Get-WinBuild
{
	#Get computer number
	$computer = Read-Host "Enter PC to find Windows Build"
    Invoke-Command -ComputerName $computer -scriptblock {Write-Host "Windows version is:"(Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name ReleaseId).ReleaseId}
}

<#Adds inputted user to the Cass-SOC-FS-Visitation Security group, enabling them to 
view the visitation room cameras.#>
Function Add-ExacqVisionSOC
{
    $shid = Read-Host -Prompt "Please enter the username of the person you want to add. ex. MayJ"
    Try
    {
        $user = Get-AdUser $shid
    }
    Catch
    {
        Write-Host "$shid does not exist, please try again with a different user." -ForegroundColor Red
        return
    }
    Add-ADGroupMember -Identity Cass-SOC-FS-DVR -Members $user -Confirm -DisablePermissiveModify
}

#Asks for computer name and remotes into the machine if available
Function RemoteAssist()
{
    [CmdletBinding()]
    Param([Parameter(Mandatory=$True)][string]$targetcomputer)

    try 
    {
        Get-AdComputer $targetcomputer | out-Null
        Test-Connection -ComputerName $targetcomputer -Quiet | Out-Null
    }
    catch 
    {
        Write-Host "$targetcomputer not found, please try a different computer." -ForegroundColor Red
        return
    }
    Start-Process "C:\Program Files (x86)\Microsoft Endpoint Manager\AdminConsole\bin\i386\CmRcViewer.exe" $targetcomputer | cmd | Out-Null
}

Function Enable-BSI {
    <# This function enables all BSI user accounts i.e. both of Dilip's accounts and Glenn's account
    ***NOTE*** you want the account to be enabled through a specific date, enter the date AFTER the day you want them enabled 
    for example, if they need to be enabled through 01/01/1990, enter 01/02/1990. 
    #>
    [string]$ExpDate = Read-Host -Prompt "Please enter the desired account expiry date. (i.e. to enable thru 10/16/2022, enter 10/17/2022)"
    # Test if the entry is a valid date
    if($ExpDate -as [datetime]) {
        # Ask which accounts to enable
        $choice = Read-Host -Prompt "Enable all accounts (1), Dilip's Accounts (2), Glenn's account (3), or quit (q)?"
        # Do the stuff
        if ($choice -eq "1") {
            Set-AdAccountExpiration -Identity dapte -DateTime $ExpDate
            Set-AdAccountExpiration -Identity apted -DateTime $ExpDate
            Set-AdAccountExpiration -Identity bietzg -DateTime $ExpDate
            Write-Host -ForegroundColor Green "Accounts are enabled and set to disable at midnight on $ExpDate. It may take a few seconds for these changes to take effect."
        }
        elseif ($choice -eq "2") {
            Set-AdAccountExpiration -Identity dapte -DateTime $ExpDate
            Set-AdAccountExpiration -Identity apted -DateTime $ExpDate   
            Write-Host -ForegroundColor Green "Dilip's accounts are enabled and set to disable at midnight on $ExpDate. It may take a few seconds for these changes to take effect." 
        }
        elseif ($choice -eq "3") {
            Set-AdAccountExpiration -Identity bietzg -DateTime $ExpDate
            Write-Host -ForegroundColor Green "Glenn's account is enabled and set to disable at midnight on $ExpDate. It may take a few seconds for these changes to take effect."
        }
        elseif ($choice -eq "q") {
            Write-Host -foregroundColor Yellow "Quitting..."
        }
        else {
            Write-Host -foregroundColor red "Please enter one of the four options (1, 2, 3, q)"
        }
    }
    else {
        Write-Host -ForegroundColor Red "Please enter a date in the format mm/dd/yyyy"
    }
}


#This thang is used to get all installed software on a remote machine and let the user pick which to uninstall
Function Remove-Software() {    
    #Get thang
    [CmdletBinding()]
    Param ([Parameter(Mandatory=$True)]
    [string]$ComputerNumber)

    #See if they're lucky or not, bomb out if they ain't
    Try
    {
        #Creates array of installed software in $CimProgs
        $CimProgs = @(Get-CimInstance -class win32_product -Property name -ComputerName $ComputerNumber -ErrorAction Stop) | Sort-Object name | Select-Object name 
        Write-Host -ForegroundColor Yellow "Note: Some programs may not appear here."
        
    }
    catch 
    {
        Write-Host -ForegroundColor Red "$ComputerNumber not found, please try again."
        break
    }

    #Set actual count
    $Cound = ($CimProgs.count-1) -as [int]

    #Iterate through installed software - Have to find out how to display software from registry 
    For($i=1; $i -lt $CimProgs.count; $i++)
    {
        Write-Host "$($i): $($CimProgs[$i].name)"
    }

    $Selection = Read-Host "Pick a number to uninstall the software or 'q' to quit"
    #Check if user entered it right, if yes turn to int
    if($Selection -eq "q")
    {
        Write-Host -ForegroundColor Cyan "Exited script. No changes have been made."
        break    
    }

    ##HELB Menu##
    elseif($Selection -eq "helb")
    {
        #Tell them they made it here
        Write-Host -ForegroundColor Magenta "Welcome to the alternate uninstall menu. Displaying software..."
        
        #Get credentials from user
        if(!(Test-Path Variable::global:GlobalCred)-or($global:GlobalCred-isnot[pscredential]))
        {
        $global:GlobalCred=Get-Credential -Credential CASSCOUNTY\$env:USERNAME
        }
        $Cred=$global:GlobalCred

        #Run Get-Package to store installed softare into array
        $InstalledPackages = @(Invoke-Command -ComputerName $ComputerNumber -Credential $Cred -ScriptBlock {Get-Package -ProviderName Programs -IncludeWindowsInstaller | Sort-Object Name | Select-Object Name})
        
        #Set Cound
        $AltCound = $InstalledPackages.count -as [int]
        
        #Iterate through array
        For($i=0; $i -lt $InstalledPackages.count; $i++)
        {
            Write-Host "$($i): $($InstalledPackages[$i].name)"
        }

        #Ask which one to uninstall
        $AltSelection = Read-Host "Pick a number to uninstall the software or 'q' to quit"
        
        #Did they want to quit?
        if($AltSelection -eq "q*")
        {
            Write-Host -ForegroundColor Cyan "Exited script. No changes have been made."
            break    
        }
        #Obviously not, typecast selection to int
        else 
        {
            $AltSelection = $AltSelection -as [int]
            #Check bounds
            if($AltSelection -gt $AltCound-1 -or $AltSelection -lt 0)
            {
                Write-Host -ForegroundColor Red "Selection not valid. Please try again."
                break
            }     

            #Create Variable with package name they want to uninstall
            $Martyr = $InstalledPackages[$AltSelection].name
        }
        #Ask if they're gucci
        Write-Host -ForegroundColor Red "Are you sure you want to uninstall $($Martyr)? y/n: " -NoNewline
        $AltSpookyDecision = Read-Host

        #If they're not serious boot them out
        if($AltSpookyDecision -ne "y")
        {
            Write-Host -ForegroundColor Cyan "Exited script. No changes have been made."
            break
        }


        #Uninstall Software
        Try
        {
            #$UninstallCommand = {msiexec.exe /x (Get-Package -Name $Using:Martyr).tagid /q}
            $UninstallCommand = {(Get-Package -Name $Using:Martyr).tagid}

            Invoke-Command -ComputerName $ComputerNumber -Credential $Cred -ScriptBlock $UninstallCommand
            
                

            Write-Host -ForegroundColor Green "You Win, $($Martyr) has been uninstalled."
            break
        }
        Catch
        {
            Write-Host -ForegroundColor Red "Oof something went wrong. Sucks to suck."
            break
        }
    }
    ##End of HELB Menu##

    else
    {
        $Selection = $Selection -as [int]
        if($Selection -gt $Cound -or $Selection -lt 1)
        {
            Write-Host -ForegroundColor Red "Selection not valid. Please try again."
            break
        }
    }

    #Ask if they're gucci
    Write-Host -ForegroundColor Red "Are you sure you want to uninstall $($CimProgs[$Selection].name)? y/n: " -NoNewline
    $SpookyDecision = Read-Host
    
    if($SpookyDecision -ne "y")
    {
        Write-Host -ForegroundColor Cyan "Exited script. No changes have been made."
        break
    }

    #Uninstall Software
    Try
    {
        $UninstallMe = Get-WmiObject -Class Win32_Product -Computername $ComputerNumber | Where-Object name -Like ($CimProgs[$Selection].name)
        $UninstallMe.uninstall()
        Write-Host -ForegroundColor Green "You win, $($CimProgs[$Selection].name) has been uninstalled."
    }
    Catch
    {
        Write-Host -ForegroundColor Red "Oof something went wrong. Sucks to suck."
    }
}


# SIG # Begin signature block
# MIIRjQYJKoZIhvcNAQcCoIIRfjCCEXoCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUMSqtlEvIFRH7vFoBuURcfutF
# iLWggg7IMIIHJDCCBgygAwIBAgIKMy1+HgAEAAAAPjANBgkqhkiG9w0BAQsFADB5
# MRIwEAYKCZImiZPyLGQBGRYCdXMxEjAQBgoJkiaJk/IsZAEZFgJuZDEUMBIGCgmS
# JomT8ixkARkWBGNhc3MxEjAQBgoJkiaJk/IsZAEZFgJjbzElMCMGA1UEAxMcQ2Fz
# cyBDb3VudHkgUm9vdCBDQS1DOVNWUjAyVjAeFw0yMDA5MTQxODUxMDZaFw0yMTA5
# MTQxOTAxMDZaMH8xEjAQBgoJkiaJk/IsZAEZFgJ1czESMBAGCgmSJomT8ixkARkW
# Am5kMRQwEgYKCZImiZPyLGQBGRYEY2FzczESMBAGCgmSJomT8ixkARkWAmNvMSsw
# KQYDVQQDEyJDYXNzIENvdW50eSBTdWJvZGluYXRlIENBLUM5U1ZSMThWMIIBIjAN
# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut+hteCAfyhVbFtZiVk6BxHPdfNe
# xfaM7WrlLv2t7eXMljn6TIoiMS+UX/BNsv87kMnLJy3BTnH9lBvNeVnjMGkzZIxA
# pJRuT/iUCQPN9AwFvF28MFbp78HzuPFiYP4zRAQ+2hgf1EMTWsIkImyqqVtAQtP6
# JTtgHbpA2dd28CXcoASg1oLiq68cgrgvoXSgy8RiGYYkzaz+v8jWWYLI92vMef30
# E+I4ZfYrSqKLw5ZOen4TeDuH6QBFRoiQe955sYBh421fLX+hiK06tUnqePCLHxRO
# 98pWFNwuGG03HlRyD8r8jTzo7R4hyDlUsH4fMCz83Sm52AE+FCYwbl+qVQIDAQAB
# o4IDpjCCA6IwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUlEa4BWSx6b5rHTRI
# cAtO/74qEmcwCwYDVR0PBAQDAgGGMBIGCSsGAQQBgjcVAQQFAgMPAA8wIwYJKwYB
# BAGCNxUCBBYEFNHJoSiHN37F+z+2TlitSXSdAqn7MBkGCSsGAQQBgjcUAgQMHgoA
# UwB1AGIAQwBBMB8GA1UdIwQYMBaAFC7LEY+yabIzRXMfOb93CIS6Bih0MIIBkwYD
# VR0fBIIBijCCAYYwggGCoIIBfqCCAXqGgdVsZGFwOi8vL0NOPUNhc3MlMjBDb3Vu
# dHklMjBSb290JTIwQ0EtQzlTVlIwMlYoMiksQ049QzlTVlIwMlYsQ049Q0RQLENO
# PVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3Vy
# YXRpb24sREM9Y28sREM9Y2FzcyxEQz1uZCxEQz11cz9jZXJ0aWZpY2F0ZVJldm9j
# YXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnSG
# Umh0dHA6Ly9jOXN2cjAydi5jby5jYXNzLm5kLnVzL0NlcnRFbnJvbGwvQ2FzcyUy
# MENvdW50eSUyMFJvb3QlMjBDQS1DOVNWUjAyVigyKS5jcmyGTGZpbGU6Ly9DOVNW
# UjAyVi5jby5jYXNzLm5kLnVzL0NlcnRFbnJvbGwvQ2FzcyBDb3VudHkgUm9vdCBD
# QS1DOVNWUjAyVigyKS5jcmwwggFVBggrBgEFBQcBAQSCAUcwggFDMIHJBggrBgEF
# BQcwAoaBvGxkYXA6Ly8vQ049Q2FzcyUyMENvdW50eSUyMFJvb3QlMjBDQS1DOVNW
# UjAyVixDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2Vydmlj
# ZXMsQ049Q29uZmlndXJhdGlvbixEQz1jbyxEQz1jYXNzLERDPW5kLERDPXVzP2NB
# Q2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9y
# aXR5MHUGCCsGAQUFBzAChmlodHRwOi8vYzlzdnIwMnYuY28uY2Fzcy5uZC51cy9D
# ZXJ0RW5yb2xsL0M5U1ZSMDJWLmNvLmNhc3MubmQudXNfQ2FzcyUyMENvdW50eSUy
# MFJvb3QlMjBDQS1DOVNWUjAyVig0KS5jcnQwDQYJKoZIhvcNAQELBQADggEBAKUK
# 2rvYEAX6yRn2j/rDaNjRALNn99ELSPCn1kqwfyK/BVOJbiRfIpvVEsNpnJBPgFO1
# SZc6h+KJGf662QWN4jI/zkX1bDTIexqrJy2wogSED/PV6L3WTH+dUrQbkgpiNx/n
# jVSxIYfjTQ27MdKiAhEMXytz77K6QnRNXaVN6sijY2lmfZvK0O1UF6NGE9VHKS+I
# cZnSxqaVoNWuIT7SmydNgNcZGCicRjfkJedrSNZd/76pFSivkeqtUfZuj+jBspb9
# i8/Qz2CBg5JuoAgB67gewaFQ7iiYIHC0Zjxcg6ochg5e1ezg3JGCoOA7HJ6KVwki
# wh52bhzTkjh6qHy6vL8wggecMIIGhKADAgECAgp4eENeAA8ABQR1MA0GCSqGSIb3
# DQEBCwUAMH8xEjAQBgoJkiaJk/IsZAEZFgJ1czESMBAGCgmSJomT8ixkARkWAm5k
# MRQwEgYKCZImiZPyLGQBGRYEY2FzczESMBAGCgmSJomT8ixkARkWAmNvMSswKQYD
# VQQDEyJDYXNzIENvdW50eSBTdWJvZGluYXRlIENBLUM5U1ZSMThWMB4XDTIxMDEw
# NTE2MDMxMloXDTIxMDkxNDE5MDEwNlowgcoxEjAQBgoJkiaJk/IsZAEZFgJ1czES
# MBAGCgmSJomT8ixkARkWAm5kMRQwEgYKCZImiZPyLGQBGRYEY2FzczESMBAGCgmS
# JomT8ixkARkWAmNvMRQwEgYDVQQLEwtDYXNzIENvdW50eTERMA8GA1UECxMISW50
# ZXJuYWwxDjAMBgNVBAsTBVVzZXJzMQwwCgYDVQQLEwNJVEQxGDAWBgNVBAsTD05l
# dHdvcmsgU3VwcG9ydDEVMBMGA1UEAxMMUm90dCwgQ2Fzc2llMIIBIjANBgkqhkiG
# 9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyzkJjsCTwps5JiQmo6sI5Sy0UbcjA4vu/gZP
# /XgyksZ7XJVXjxU2RHCj678fODYgXaskNLY3UylCrS55rvRCEi2XwmRA+76bBh5Z
# 8CiKuB6SSy1XXi250w05t25IUKTSSRNY32/h8xIp3YME35/gA9cNtXm82jb+Hs/P
# K+GooCHY8B3wDdZiwQ2HX2MUrTVu2YZQ/HQK+hGWW4zepkFrPn3/qMY/sb21kc+R
# 4DhnxCi19z4aSD+ifzMOpyFCPsM6oXjqHaIOJUJTTDeJnve+GNyYWSRf2739MwQt
# /8j0KazB0IUWLFr6OvY2wyLP0bhTJjqMJHZnhArj7i5UC8FnjQIDAQABo4IDzDCC
# A8gwPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGCNxUImplxgvPDYO2HLYfp+kWH2Y4o
# gQeEotB9h92AZAIBZAIBCDATBgNVHSUEDDAKBggrBgEFBQcDAzAOBgNVHQ8BAf8E
# BAMCB4AwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDAzAdBgNVHQ4EFgQUAIfl
# Wq/q74SibYybPD0R2y6EfPIwHwYDVR0jBBgwFoAUlEa4BWSx6b5rHTRIcAtO/74q
# EmcwggFTBgNVHR8EggFKMIIBRjCCAUKgggE+oIIBOoaB3GxkYXA6Ly8vQ049Q2Fz
# cyUyMENvdW50eSUyMFN1Ym9kaW5hdGUlMjBDQS1DOVNWUjE4VigxNSksQ049QzlT
# VlIxOFYsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZp
# Y2VzLENOPUNvbmZpZ3VyYXRpb24sREM9Y28sREM9Y2FzcyxEQz1uZCxEQz11cz9j
# ZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlz
# dHJpYnV0aW9uUG9pbnSGWWh0dHA6Ly9jOXN2cjE4di5jby5jYXNzLm5kLnVzL0Nl
# cnRFbnJvbGwvQ2FzcyUyMENvdW50eSUyMFN1Ym9kaW5hdGUlMjBDQS1DOVNWUjE4
# VigxNSkuY3JsMIIBYgYIKwYBBQUHAQEEggFUMIIBUDCBzwYIKwYBBQUHMAKGgcJs
# ZGFwOi8vL0NOPUNhc3MlMjBDb3VudHklMjBTdWJvZGluYXRlJTIwQ0EtQzlTVlIx
# OFYsQ049QUlBLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2Vz
# LENOPUNvbmZpZ3VyYXRpb24sREM9Y28sREM9Y2FzcyxEQz1uZCxEQz11cz9jQUNl
# cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0
# eTB8BggrBgEFBQcwAoZwaHR0cDovL2M5c3ZyMTh2LmNvLmNhc3MubmQudXMvQ2Vy
# dEVucm9sbC9DOVNWUjE4Vi5jby5jYXNzLm5kLnVzX0Nhc3MlMjBDb3VudHklMjBT
# dWJvZGluYXRlJTIwQ0EtQzlTVlIxOFYoMTUpLmNydDBJBgNVHREEQjBAoCYGCisG
# AQQBgjcUAgOgGAwWUm90dENAY2Fzc2NvdW50eW5kLmdvdoEWUm90dENAY2Fzc2Nv
# dW50eW5kLmdvdjANBgkqhkiG9w0BAQsFAAOCAQEAfqeYoFKQTS2sAPL4vXwYY7ev
# iex0KPrvAbWWXPkHBTrzRRXOsGdOpkMKQauENUxIdIBezcpGNOGDXVQj/ak0/aqa
# h6Nxq7zWUCWueJgrHtpaQFKsNZfumUM6CLt8rVqAVIRqjG1gSCDjKJpe8jCYVtvQ
# VOOo9lqyuyqTEccQ85jzn/ZZ1G0etKV2OIJeMsIG+rfsgk9caEFIdQyylb5U0Swj
# ONXLt+BTtH5mNS1YFUAUy9/tHwVAWQmXrPqgQHmljLZzwWTKNFIcT/dZJSY7O1us
# jbmjyAVL7kxbP2+PJy5t0l0f4YFgM1pxpNq1H2S6glsRFEPoUDUmOBuc9LsE5TGC
# Ai8wggIrAgEBMIGNMH8xEjAQBgoJkiaJk/IsZAEZFgJ1czESMBAGCgmSJomT8ixk
# ARkWAm5kMRQwEgYKCZImiZPyLGQBGRYEY2FzczESMBAGCgmSJomT8ixkARkWAmNv
# MSswKQYDVQQDEyJDYXNzIENvdW50eSBTdWJvZGluYXRlIENBLUM5U1ZSMThWAgp4
# eENeAA8ABQR1MAkGBSsOAwIaBQCgeDAYBgorBgEEAYI3AgEMMQowCKACgAChAoAA
# MBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcCAQsxDjAMBgor
# BgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBTuOjr3qJKwKiFHZ1/jPaXaxKAfCjAN
# BgkqhkiG9w0BAQEFAASCAQCMO6OxwYKahTohxtceNojamAFtgkXRLzpsPrWJXNru
# Ecl5lBMQoDT8FA562CxPiKToDGh4wM2dzJxULosj+av4U2xrsO0/ry2DeePmyVA1
# hQLTQ0ilaFlbz3ivMxOI8URBYo8DIoMCpDCDnkm8yBoyCrKSGf8JTodnAdFRaD/f
# DZ12fyPuzCbePSfxPEtQblVqbzA6xZ6zrlk2ZmW6u9rduad8YrAwSyZnWd5KP7uN
# l0hswTQAS1ZlLO7hMgcijYNRUoXdGga3eiscV/sti2VOelmiZj7mhJf2/XQUbJri
# ZTBwYs4gn5G6ZVZFGb2fSNBd95IJFJJOSpAT1/RgJw+z
# SIG # End signature block
