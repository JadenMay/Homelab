Set-Location C:\
$FunctionLocation = "C:\.THANGS\Lab\Homelab\PowershellFunctions"

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

<# This is a template
Function FunctionName {
    #filepath
}
#>

Function Say-Something {
    . $FunctionLocation\Say-Something\Say-Something.ps1
}

Function Show-Movies {
    . $FunctionLocation\Show-Movies.ps1
}

Function Copy-SSH {
    . $FunctionLocation\Copy-SSH\Copy-SSH.ps1
}

Function MAS {
    . $FunctionLocation\MAS.ps1
}
