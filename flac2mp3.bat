@echo off
# Flac2MP3
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Toolkit
# Use Permitted under MIT licence


REM Prompt the user for the FLAC directory path
set /p "flac_directory=Enter the path to the folder containing the FLAC files: "

REM Check if the specified directory exists
if not exist "%flac_directory%" (
  echo Error: The specified directory does not exist.
  exit /b 1
)

REM Prompt the user for the MP3 output directory
set /p "mp3_directory=Enter the path to the folder to save the MP3 files: "

REM Create the MP3 output directory if it doesn't exist
mkdir "%mp3_directory%" 2>nul

REM Convert FLAC to MP3 using ffmpeg
for %%I in ("%flac_directory%\*.flac") do (
  ffmpeg -i "%%I" -ab 320k "%mp3_directory%\%%~nI.mp3"
  echo Converted %%~nI.flac to %%~nI.mp3
)
