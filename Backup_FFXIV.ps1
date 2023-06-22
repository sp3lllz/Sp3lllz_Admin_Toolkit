#Backup FFXIV
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Toolkit
# Use Permitted under MIT licence

#Promt User For the various paths needed to run the script
$gamePath =Read-Host -Prompt "Enter the path of the game folder (usually located at C:\Users\YOURUSERNAME\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn):"
$pluginsPath = Read-Host -Prompt "Enter the path of your plugins folder (usually located at C:\Users\YOURUSERNAME\AppData\Roaming\XIVLauncher\pluginConfigs):"
$backupPath = Read-Host -Prompt "Enter the path you want to back up to:"
#Get the Date
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$newFolder = "$backupPath\$date"
$folders = Get-ChildItem -Path $backupPath -Directory
 
# Prompt for OneDrive usage prompt user if they use onedrive 
$useOneDrive = Read-Host -Prompt "Do you use OneDrive? (Y/N)"

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

#Make a new folder inside backup path with the date add time
New-Item -ItemType Directory -Path $newFolder
#Make a folder for plugins and the game inside the dated folder
New-Item -ItemType Directory -Path "$newFolder\plugins"
New-Item -ItemType Directory -Path "$newFolder\game"
#backup the data from the provided paths to the back up path 
robocopy $pluginsPath "$newFolder\plugins" /E /COPY:DAT /R:1 /W:1
robocopy $gamePath "$newFolder\game" /E /COPY:DAT /R:1 /W:1

#compress the backups to a zip file and delete the uncompressed backup 
Compress-Archive -Path "$newFolder\plugins" -DestinationPath "$newFolder\plugins.zip"
Remove-Item "$newFolder\plugins" -Recurse
Compress-Archive -Path "$newFolder\game" -DestinationPath "$newFolder\game.zip"
Remove-Item "$newFolder\game" -Recurse
foreach ($folder in $folders) {
    $folderDate = (Get-Item $folder.FullName).CreationTime
    $age = New-TimeSpan -Start $folderDate -End $currentDate
    if ($age.TotalDays -gt 365) {
        Remove-Item -Path $folder.FullName -Recurse -Force
    }
