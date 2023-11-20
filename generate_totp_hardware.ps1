function Generate-RandomNumber {
    $random = New-Object System.Random
    $randomNumber = $random.Next(10000000, 100000000)
    return $randomNumber
}

function Generate-HexString {
    $randomNumber = Generate-RandomNumber
    $random = New-Object System.Security.Cryptography.RNGCryptoServiceProvider
    $bytes = New-Object byte[] 20
    $random.GetBytes($bytes)
    $hexString = -join ($bytes | ForEach-Object { $_.ToString("X2") })
    return $randomNumber, $hexString
}

function Convert-HexToBase32($hexString) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($hexString)
    $base32String = [Convert]::ToBase64String($bytes)
    # Remove trailing '==' characters
    $base32String = $base32String.TrimEnd('=')
    return $base32String
}

# Prompt user for the number of keys to generate
$numKeys = Read-Host "Enter the number of keys to generate"

# Loop to generate keys and append to CSV
for ($i = 1; $i -le $numKeys; $i++) {
    # Generate random 8-digit number and hex string
    $randomNumber, $hexString = Generate-HexString

    # Convert to base32
    $base32String = Convert-HexToBase32 $hexString

    # Create a PowerShell object with properties
    $outputObject = [PSCustomObject]@{
        RandomNumber = $randomNumber
        Base32String = $base32String
    }

    # Append to CSV file
    $outputObject | Export-Csv -Path "output.csv" -NoTypeInformation -Append
}

Write-Output "Data saved to output.csv"
