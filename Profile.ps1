Set-Location C:\

Function Profile {
    Clear-Host
    Write-Host " Homelab Powershell Profile EST. 7/14/22" -ForegroundColor Magenta
    Write-Host "
    Say-Something
    Show-Movies
    Copy-SSH
    " -ForegroundColor Green
}
Profile
Set-Alias -Name menu -Value Profile

Function FunctionName {
    #filepath
}

Function Say-Something {
    D:\Git\Homelab\PowershellFunctions\Say-Something\Say-Something.ps1
}

Function Show-Movies {
    D:\Git\Homelab\PowershellFunctions\Show-Movies.ps1
}

Function Copy-SSH {
    D:\Git\Homelab\PowershellFunctions\Copy-SSH\Copy-SSH.ps1
}

Function MAS {

}
