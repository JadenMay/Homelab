Set-ADDefaultDomainPasswordPolicy -Identity jdev.local -LockoutDuration 00:01:00 -LockoutObservationWindow 00:03:00 -ComplexityEnabled $false -ReversibleEncryptionEnabled $False


$NewPassword = (Read-Host -Prompt "Provide New Password" -AsSecureString) 
Set-ADAccountPassword -Identity DavidChe -NewPassword $NewPassword -Reset