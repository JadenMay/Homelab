#This guy grabs the host of the shit you put in
Write-Host -ForegroundColor Blue "What's the shit:" -NoNewline
$Shit = Read-Host

nslookup.exe $Shit