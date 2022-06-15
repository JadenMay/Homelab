#Enable RDP
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"


#New Domain Admin
$pw = Read-Host -Prompt 'Enter a Password for this user' -AsSecureString 
New-ADUser -Name test05 -AccountPassword $pw -Passwordneverexpires $true -Enabled $true
Add-ADGroupMember -Identity "Domain Admins" -Members test05

#Install DC + ADDS
Add-WindowsFeature AD-Domain-Services
Install-ADDSForest -DomainName name.local -InstallDNS