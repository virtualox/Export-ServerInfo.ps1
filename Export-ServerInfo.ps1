<#
.SYNOPSIS
This script retrieves server information from Active Directory and exports it to a CSV file.

.DESCRIPTION
The script queries Active Directory for server objects and extracts the following information:
- Server Name (Hostname)
- IP Address
- FQDN
- Operating System
- Description

The extracted data is then exported to a CSV file.

.PARAMETER OutputPath
The path to the CSV file where the data should be saved.

.EXAMPLE
.\Export-ServerInfo.ps1 -OutputPath "C:\path\to\output.csv"

.NOTES
Make sure the Active Directory module is installed and you have sufficient rights to query AD.
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$OutputPath
)

# Requires the Active Directory module to be installed
Import-Module ActiveDirectory

# Query AD for servers
$servers = Get-ADComputer -Filter 'OperatingSystem -like "Windows Server*"' -Properties OperatingSystem, Description, DNSHostName, IPv4Address

# Create an object with the desired output for each server
$output = $servers | ForEach-Object {
    [PSCustomObject]@{
        'ServerName'       = $_.Name
        'IP Address'       = $_.IPv4Address
        'FQDN'             = $_.DNSHostName
        'Operating System' = $_.OperatingSystem
        'Description'      = $_.Description
    }
}

# Export the object to a CSV file
$output | Export-Csv -Path $OutputPath -NoTypeInformation -Delimiter "`t"
