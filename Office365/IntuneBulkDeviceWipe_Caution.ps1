﻿$IntuneModule = Get-Module -Name "Microsoft.Graph.Intune" -ListAvailable
if (!$IntuneModule){
 
write-host "Microsoft.Graph.Intune Powershell module not installed..." -f Red
write-host "Install by running 'Install-Module Microsoft.Graph.Intune' from an elevated PowerShell prompt" -f Yellow
write-host "Script can't continue..." -f Red
write-host
exit
}
####################################################
# Importing the SDK Module
Import-Module -Name Microsoft.Graph.Intune
 
if(!(Connect-MSGraph)){
Connect-MSGraph
}
####################################################
 
#### Insert your script here
 
#### Gets all devices running Windows
$Devices1 = Get-IntuneManagedDevice -Filter "contains(operatingsystem,'Windows')"
$Devices = $Devices | where DeviceName -eq DKSURFACE02 



<#>
Foreach ($Device in $Devices)
{

Invoke-IntuneManagedDeviceCleanWindowsDevice -managedDeviceId $Device.managedDeviceId -keepUserData $False -Verbose
Write-Host "Fresh Start Request Sent to Device with DeviceID $($Device.managedDeviceID)" -ForegroundColor Yellow

}
####################################################

</#>

<#>
get-command -Module microsoft.graph.intune | select name | where name -like *invoke*

</#>