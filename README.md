# Sp3lllz_Toolkit

## Welcome!
Hello there, welcome to my toolkit of scripts that i have written over the years. I have worked in the IT industry for over 10 years now and over that time have accumulated various scripts that I have written to help fix issues that have arose throughout my career. I decided that if these are useful for me they must be usful for others too and such I started this github repository and make it open source under the MIT licence please feel free to use these scripts for whatever your use may be (within the confines of that license of course).

There also some non work related scripts on here too so dont be too confused about those. 

Please see the below index for a list of the scripts included in this and a breif description of each as well as any prerequisites to running a script 

## Index

### 1. Direct_Access_fix.ps1
This Sctipt is helps in a bind if your company uses direct access and your certificate expires before you can generate a new one to remove the old registry files and reboot the machine. Prerequisites: the device must be on site or at the least brought onsite after running this in order for the Direct Access settings to be refreshed once the script is run. 
### 2.Print_Nightmare_Fix.ps1
This Script is a registry edit workaround for print nightmare this was written for Windows 10 22H1 and Windows 11 22H1 I cannot gaurentee this works on other verions of windows due to the nature of the issue this is trying to fix. 
### 3. Lightspeed_Replace_Certs.bat
This is a bat file that will replace the certificate for the lightspeed filtering system used in some schools and colleges if they expire 
### 4. Add_2_Datto.ps1 
A short script to add the Datto agent to a machine 
### 5. DHCP_Info_Fetch.ps1
This script will fetch the DHCP scopes and a list of reservations in two CSVs (one for scopes and one for reservations) Prerequisites: this must be run on the DHCP server 
### 6. Dead_Folder_Finder.ps1
This one is kind of self explanitory, but very handy you specify a directory and it will scan and look for empty folders and remove them  
### 7. Backup_FFXIV.ps1
Just a little script I whiped up to backup my final fantasy files or when installing plugins juuuuussst in case
### 8. Restore_FFXIV.ps1
Does the opposite of the backup script 
### 9. Modded_Fallout4_copy_to_steamdeck.sh
copys a modded copy of fallout 4 from a pc to a pc over SSH Prerequisites: have fallout 4 installed on your steam deck aswell as a copy installed on pc modded using the vortex mod manager. SSH also need to be enabled on your steamdeck 
### 10. Clean_Your_Desktop.ps1
moves all those files you dumped on to your desktop to their correct places automagically 
### 11. FLAC_2_MP3.bat
Simple batch script that uses ffmpeg to convert FLAC files to MP3 @ 320Kbps Prerequisites: FFMPEG must be installed you can check this by opening up a terminal window and running `ffmpeg -version`
### 12. Generate_TOTP_Hardware.ps1
This script generates a random 8 digit serial and hex seed derived base32 secret key for SHA-1 TOTP based MFA Tokens this is handy for use with Microsoft Azure and Cisco Duo where the only to use 3rd party TOTP apps is to input hardware token information. 
This will output a CSV of the tokens generated for simple import into Azure and Cisco Duo
