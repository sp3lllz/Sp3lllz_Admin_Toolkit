# Copy Fallout 4 
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Admin_Toolkit
# Use Permitted under MIT licence

#grab the users username
username=$(whoami)
echo "The username of the currently logged in user is: $username"
# Variables for the folders to be copied and the remote server details
srcFolder1="C:\Users\\$username\AppData\Roaming\Vortex"
srcFolder2="C:\Users\\$username\AppData\Local\Fallout4"
srcFolder3="C:\Users\\$username\OneDrive\Documents\My Games\Fallout4"
srcFolder4="C:\Program Files (x86)\Steam\steamapps\common\Fallout 4"

destUser="deck"
#destHost="10.10.10.3"
destFolder1="/home/deck/.local/share/Steam/steamapps/compatdata/377160/pfx/drive_c/users/steamuser/AppData/Roaming"
destFolder2="/home/deck/.local/share/Steam/steamapps/compatdata/377160/pfx/drive_c/users/steamuser/AppData/Local"
destFolder3="/home/deck/.local/share/Steam/steamapps/compatdata/377160/pfx/drive_c/users/steamuser/Documents/My Games"
destFolder4="/home/deck/.local/share/Steam/steamapps/common"

echo "Enter your IP address: "
read destHost


# Copy the first folder to the first destination on the remote server using scp
scp -r $srcFolder1 "$destUser@$destHost:$destFolder1"

# Copy the second folder to the second destination on the remote server using scp
scp -r $srcFolder2 "$destUser@$destHost:$destFolder2"

# Copy the third folder to the third destination on the remote server using scp
scp -r $srcFolder3 "$destUser@$destHost:$destFolder3"

# Copy the fourth folder to the fourth destination on the remote server using scp
scp -r $srcFolder4 "$destUser@$destHost:$destFolder4"

# Confirm that the copy was successful
echo "Folders copied successfully to $destHost"

# Pause the script execution and wait for the user to press enter
echo "Press enter to continue"
read

# The script will continue after the user presses enter
echo "The script has resumed execution"
