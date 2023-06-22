#Restore FFXIV
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Toolkit
# Use Permitted under MIT licence

#Promt User For the various paths needed to run the script
$gamePath =Read-Host -Prompt "Enter the path of the game folder (usually located at C:\Users\YOURUSERNAME\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn):"
$pluginsPath = Read-Host -Prompt "Enter the path of your plugins folder (usually located at C:\Users\YOURUSERNAME\AppData\Roaming\XIVLauncher\pluginConfigs):"
$backupPath = Read-Host -Prompt "Enter the path you want to restore the backup from (please use the folder where the zip is not the path of the zip itself):"
#Get the Date
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$newFolder = "$backupPath\$date"
$folders = Get-ChildItem -Path $backupPath -Directory

# Check if user uses OneDrive
if ($useOneDrive -eq "Y" -or $useOneDrive -eq "y") {
    # Check if OneDrive sync agent is running
    $onedriveProcess = Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue

    if ($onedriveProcess -eq $null) {
        Write-Host "OneDrive sync agent is not running. Starting it now..."
        Start-Process -FilePath "C:\Program Files\Microsoft OneDrive\OneDrive.exe"
    }
    else {
        Write-Host "OneDrive sync agent is already running."
    }
}
else {
    Write-Host "Skipping... Onedrive is not used"
}


$backupPath = "C:\Users\spell\OneDrive\Documents\FFXIV Backups"
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$newFolder = "$backupPath\$date"
$pluginsPath = "C:\Users\spell\AppData\Roaming\XIVLauncher\pluginConfigs"
$gamePath = "C:\Users\spell\OneDrive\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn"

Expand-Archive -Path "$backupPath\plugins.zip" -DestinationPath "$backupPath\plugins"
robocopy "$backupPath\plugins" $pluginsPath /E /COPY:DAT /R:1 /W:1
Expand-Archive -Path "$backupPath\game.zip" -DestinationPath "$backupPath\game"
robocopy "$backupPath\game" $gamePath /E /COPY:DAT /R:1 /W:1
