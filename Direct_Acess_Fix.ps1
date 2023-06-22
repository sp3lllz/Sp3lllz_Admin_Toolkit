# Direct Access Fix
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Toolkit
# Use Permitted under MIT licence

#Self Elevation of console
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
#Warn User Machine Will Be Rebooted
write-Warning "Warning! The machine will be restarted at the end of this script please makesure all work is saved before continuing"
start-sleep -s 1
#Remove Old DA Registry Records
Write-Output "Removing Old Direct Access Records"
Get-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient\DnsPolicyConfig" | Remove-Item -Confirm:$false
Start-Sleep -s 1
#Notify User that this is completed
Write-Output "Old Direct Access Records Removed"
Start-Sleep -s 1
#Restart Machine
Write-Output "Rebooting"
shutdown /r
