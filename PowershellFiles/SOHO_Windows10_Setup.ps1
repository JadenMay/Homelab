# This script is used to get rid of Windows 10 bloatware and perform other duties to make home PCs optimized
https://www.repairwin.com/how-to-completely-remove-built-in-apps-from-windows-10/
# Get all installed provisioned apps in an array


$ProvisionedApps = Get-AppxProvisionedPackage -online
$ProvisionedApps

# Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -eq 'microsoft.microsoft3dviewer'} | Remove-AppxProvisionedPackage -online

