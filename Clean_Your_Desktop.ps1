# Clean_Your_Desktop
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Admin_Toolkit
# Use Permitted under MIT licence

$username =  echo $env:username
Write-Host "Hello $username"
$useOneDrive = Read-Host "Do you use OneDrive? (Y/N)"

if ($useOneDrive -eq "Y" -or $useOneDrive -eq "y") {
    $desktopPath = "C:\Users\$username\OneDrive\Desktop"
	$photosPath = "C:\Users\$username\OneDrive\Pictures"
    $documentsPath = "C:\Users\$username\OneDrive\Documents"
    $musicPath = "C:\Users\$username\OneDrive\Music"
    $videosPath = "C:\Users\$username\OneDrive\Videos"
}

else  {
	$desktopPath = "C:\Users\$username\Desktop"
	$photosPath = "C:\Users\$username\Pictures"
	$documentsPath = "C:\Users\$username\Documents"
	$musicPath = "C:\Users\$username\Music"
	$videosPath = "C:\Users\$username\Videos"
}


Write-Host "Checking desktop for files..."

$photoExtensions = @("jpg", "jpeg", "png", "gif", "bmp", "tiff", "tif", "ico", "svg", "eps", "raw", "psd", "heif")
$documentExtensions = @("doc", "docx", "pdf", "txt", "xls", "xlsx", "ppt", "pptx", "csv", "rtf", "odt", "ods", "odp")
$audioExtensions = @("mp3", "wav", "flac", "aac", "wma", "m4a", "ogg", "ac3", "alac", "ape", "mka", "aac")
$videoExtensions = @("mp4", "avi", "mkv", "mov", "wmv", "flv", "webm", "3gp", "mpg", "mpeg", "vob", "mts", "m2ts", "webp")

function MoveFilesToFolder($sourcePath, $targetPath, $extensions) {
    $filesFound = $false

    foreach ($extension in $extensions) {
        $files = Get-ChildItem -Path $sourcePath -Filter "*.$extension" -File
        if ($files.Count -gt 0) {
            $filesFound = $true
            foreach ($file in $files) {
                $fileName = $file.Name
                $destinationPath = Join-Path -Path $targetPath -ChildPath $fileName
                Move-Item $file.FullName $destinationPath
                Write-Host "Moved file: $fileName to: $destinationPath"
            }
        }
    }

    if ($filesFound) {
        Write-Host "Moved files from $sourcePath to $targetPath"
    } else {
        Write-Host "No files found in $sourcePath"
    }
}

Write-Host "Moving photos..."
MoveFilesToFolder $desktopPath $photosPath $photoExtensions

Write-Host "Moving documents..."
MoveFilesToFolder $desktopPath $documentsPath $documentExtensions

Write-Host "Moving audio files..."
MoveFilesToFolder $desktopPath $musicPath $audioExtensions

Write-Host "Moving video files..."
MoveFilesToFolder $desktopPath $videosPath $videoExtensions

Write-Host "All files have been moved successfully!"