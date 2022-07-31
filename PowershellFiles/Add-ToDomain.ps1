#Enable RDP
Write-Host -ForegroundColor Green "Enabling RDP..."
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

#Enable PsRemoting
Write-Host -ForegroundColor Green "Enabling PsRemoting..."
Enable-PSRemoting -Force

#Rename
Write-Host -ForegroundColor Cyan "Name this PC:" -NoNewline
$Name = Read-Host
Rename-Computer $Name

#Set IP Address
Write-Host -ForegroundColor Green "Gathering network adapters..."
$NetAdapterArr = @()
$NetAdapterArr = get-netadapter -name * | select name,ifindex
for($i=0;$i -lt $NetAdapterArr.count;$i++)
{
    Write-Host "$($i): $($NetAdapterArr[$i].name)"
}
Write-Host -ForegroundColor Cyan "Please select an adapter to configure:" -NoNewline
$Selection = Read-Host
Write-Host "You selected: $($Selection) which is $($NetAdapterArr[$Selection].name)"
Write-Host -ForegroundColor Cyan "Gimme the IP 192.168.1.xxx" -NoNewline
$EyePee = Read-Host
New-NetIPAddress -InterfaceAlias $NetAdapterArr[$Selection].name -IPAddress $EyePee -PrefixLength 24 -DefaultGateway 192.168.1.1

#Set DNS
Set-DnsClientServerAddress -InterfaceAlias $NetAdapterArr[$Selection].name -ServerAddresses 192.168.1.250

#Join Domain
Write-Host -ForegroundColor Magenta "Joining jdev..."
Add-Computer -Domain jdev -Credential jdev\jdevadmin

#Shutdown
Write-Host -ForegroundColor Red "Restarting $env:Computername in 120 seconds. Hurry up."
shutdown /r /f /t 120

#Activation
\\dc01\c$\Tools\MicrosoftActivationScripts_1.5\All-In-One-Version\MAS_1.5_AIO_CRC32_21D20776.cmd -Credential jdev\jdevadmin
