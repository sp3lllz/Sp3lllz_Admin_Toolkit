#Lightspeed Cert Fix
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Admin_Toolkit
# Use Permitted under MIT licence

#Elevate the prompt
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

# Set the URL of the bat file to download
$url = "https://lssweb-cdn-assets.s3.amazonaws.com/help-lightspeed/replace_certs.bat"

# Set the path where the bat file will be saved
$outfile = "$env:TEMP\replace_certs.bat"

# Download the bat file from the URL
Invoke-WebRequest -Uri $url -OutFile $outfile

# Run the downloaded bat file
& $outfile
