#Add2Datto
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Toolkit
# Use Permitted under MIT licence

# Prompt for user input
$dattourl = Read-Host -Prompt "Enter a a datto install url:"


(New-Object System.Net.WebClient).DownloadFile($dattourl, "$env:TEMP/AgentInstall.exe");start-process "$env:TEMP/AgentInstall.exe"
