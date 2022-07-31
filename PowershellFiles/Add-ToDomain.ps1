#Enable RDP
Write-Host -ForegroundColor Green "Enabling RDP"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

#Enable PsRemoting
Enable-PSRemoting -Force

#Rename
Write-Host -ForegroundColor Cyan "Name me pls: " -NoNewline
$Name = Read-Host
Rename-Computer $Name

#Set IP Address
Write-Host -ForegroundColor Cyan "Gimme the IP: " -NoNewline
$EyePee = Read-Host
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress $EyePee -PrefixLength 24 -DefaultGateway 192.168.1.1

#Set DNS
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.1.250

#Join Domain
Write-Host -ForegroundColor Magenta "Joining jdev..."
Add-Computer -Domain jdev -Credential jdev\jdevadmin

#Shutdown
Write-Host -ForegroundColor Red "Restarting $env:Computername in 120 seconds. Hurry up."
shutdown /r /f /t 120

#Activation
\\hyperv01\HyperVFiles\MicrosoftActivationScripts_1.5\All-In-One-Version\MAS_1.5_AIO_CRC32_21D20776.cmd -Credential jdev\jdevadmin

