#Backup FFXIV
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Admin_Toolkit
# Use Permitted under MIT licence

#Promt User For the various paths needed to run the script
$gamePath =Read-Host -Prompt "Enter the path of the game folder (usually located at C:\Users\YOURUSERNAME\Documents\My Games\FINAL FANTASY XIV - A Realm Reborn):"
$pluginsPath = Read-Host -Prompt "Enter the path of your plugins folder (usually located at C:\Users\YOURUSERNAME\AppData\Roaming\XIVLauncher\pluginConfigs):"
$backupPath = Read-Host -Prompt "Enter the path you want to back up to:"
#Get the Date
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$newFolder = "$backupPath\$date"

#Make a new folder inside backup path with the date add time
New-Item -ItemType Directory -Path $newFolder
#Make a folder for plugins and the game inside the dated folder
New-Item -ItemType Directory -Path "$newFolder\plugins"
New-Item -ItemType Directory -Path "$newFolder\game"
#backup the data from the provided paths to the back up path 
robocopy $pluginsPath "$newFolder\plugins" /E /COPY:DAT /R:1 /W:1
robocopy $gamePath "$newFolder\game" /E /COPY:DAT /R:1 /W:1
