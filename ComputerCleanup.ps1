<#
Run this guy to get all computer information and attempt to clean it up
#>

# Get all relevant PC info (also to do more with it in future maybe)
$ComputerInformation = Get-ComputerInfo -Property windowsinstalldatefromregistry,csname,csdomain,cshypervisorpresent,csmodel,csnetworkadapters,csnumberoflogicalprocessors,csprocessors,cspartofdomain,cssystemtype,osname,oslastbootuptime

# Spit it all out
Write-Output $ComputerInformation

# Run DISM to ensure image is healthy
dism /online /cleanup-image /restorehealth

# Do a SFC to repair
sfc /scannow

# Remove bloatware from computer (WIP, maybe select keywords for removal? i.e. if matches "zune" kill it)
$Packages = Get-AppxProvisionedPackage -Online


Remove-AppxProvisionedPackage -PackageName "Microsoft.BingNews"
Remove-AppxProvisionedPackage -PackageName "Microsoft.GamingApp"
Remove-AppxProvisionedPackage -PackageName "Microsoft.ScreenSketch"
Remove-AppxProvisionedPackage -PackageName "Microsoft.Whiteboard"
Remove-AppxProvisionedPackage -PackageName "Microsoft.WindowsAlarms"
Remove-AppxProvisionedPackage -PackageName "Microsoft.ZuneMusic"
Remove-AppxProvisionedPackage -PackageName "MicrosoftTeams"

