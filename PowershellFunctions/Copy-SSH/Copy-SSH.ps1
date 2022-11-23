
Write-Host -ForegroundColor Cyan "Gimme the filepath: " -NoNewline
$Filepath = Read-Host

Write-Host -ForegroundColor Cyan "Gimme the destination (linux01 to go there)" -NoNewline
$Dest = Read-Host

if($Dest -eq "linux01")
{
    $Dest = "jmay@linux01:/home/jmay"
}

Set-Location D:\Git\Homelab\PowershellFunctions\Copy-SSH
pscp $Filepath $Dest
Set-Location C:\
