##DHCP Info Fetch##
# v1.0
# Written By Sp3lllz
# https://github.com/sp3lllz/Sp3lllz_Admin_Toolkit
# Use Permitted under MIT licence

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }


# Get the name of the local machine
$machineName = $env:COMPUTERNAME


# Get IP scopes
$scopes = Get-DhcpServerv4Scope

# Create an array to store IP scopes information
$scopesInfo = @()

# Loop through each scope and add its information to the array
foreach ($scope in $scopes) {
    $scopeInfo = [PSCustomObject]@{
        ScopeId = $scope.ScopeId
        SubnetMask = $scope.SubnetMask
        Name = $scope.Name
        State = $scope.State
    }
    $scopesInfo += $scopeInfo
}

# Export IP scopes information to a CSV file with machine name included
$fileName = "Scopes_$machineName.csv"
$scopesInfo | Export-Csv -Path "C:\$fileName" -NoTypeInformation

# Create an array to store DHCP reservation information
$reservationsInfo = @()

# Loop through each scope and retrieve its reservations
foreach ($scope in $scopes) {
    $reservations = Get-DhcpServerv4Reservation -ScopeId $scope.ScopeId

    # Loop through each reservation and add its information to the array
    foreach ($reservation in $reservations) {
        $reservationInfo = [PSCustomObject]@{
            Scope = $scope.Name
            IPAddress = $reservation.IPAddress
            MACAddress = $reservation.ClientId
            Name = $reservation.Name
            Description = $reservation.Description
        }
        $reservationsInfo += $reservationInfo
    }
}

# Export DHCP reservations information to a CSV file with machine name included
$fileName = "Reservations_$machineName.csv"
$reservationsInfo | Export-Csv -Path "C:\$fileName" -NoTypeInformation