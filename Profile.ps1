Set-Location C:\

Function Profile {
    Clear-Host
    Write-Host "#=========================================================================================#"
    Write-Host "|                                                                                         |"
    Write-Host "|        " -NoNewLine; Write-Host -foregroundcolor Green "Homelab Powershell Profile EST. 7/14/22" -NoNewLine; write-host "                                          |"
    Write-Host "|                                                                                         |"
    Write-Host "|        " -nonewline; write-host -foregroundcolor Cyan "Test gives you Red" -NoNewline; write-host "                                                               |"
    Write-Host "|                                                                                         |"
    Write-Host "#=========================================================================================#"
}
Profile



Function Test {
    D:\Git\Homelab\PowershellFunctions\Red.ps1
}

<#
Open Powershell admin window 

Enter:  

notepad $profile.allusersallhosts 

Save the document 

C/P the contents of \\sccm\sandbox$\Scripts\PutonindividualPC.ps1 into the notepad file and save it 

Make sure execution policy is set to bypass 
#>