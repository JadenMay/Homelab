<#
This function copies a file from the local computer (or honestly wherever it has access) to the remote destination
#>

# Get the path of the file you want to copy
$Filepath = Read-Host -Prompt "What's the local filepath of the file you want to move"

# Show an example of a remote linux host
Write-Host -ForegroundColor Magenta "Example: jmay@linux01:/home/jmay"

# Ask for the destination filepath
$Dest = Read-Host -Prompt "What is the remote host filepath?"

# Set location of PSCP executable
Set-Location D:\Git\Homelab\PowershellFunctions\Copy-SSH

# Run the file copy
pscp $Filepath $Dest | Out-Host

# Set location back to default
Set-Location C:\
