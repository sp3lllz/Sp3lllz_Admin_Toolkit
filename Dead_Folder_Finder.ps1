##Dead Folder Finder##
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Admin_Toolkit
# Use Permitted under MIT licence

$dir = Read-Host "Enter directory path"

if (Test-Path $dir) {
    $emptyFolders = Get-ChildItem $dir -Recurse | Where-Object {$_.PSIsContainer -eq $true -and @(Get-ChildItem $_.FullName -Recurse | Where-Object {$_.PSIsContainer -eq $false}).Count -eq 0}
    
    if ($emptyFolders) {
        foreach ($folder in $emptyFolders) {
            Remove-Item $folder.FullName -Recurse -Force
            Write-Host "Removed empty folder: $($folder.FullName)"
        }
    } else {
        Write-Host "No empty folders found in the directory."
    }
} else {
    Write-Host "The specified directory does not exist."
}
