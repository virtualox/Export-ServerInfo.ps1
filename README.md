# Export Server Info from Active Directory

This PowerShell script retrieves server information from Active Directory and exports it to a CSV file.

## Features

- Retrieves the following server details from Active Directory:
  - Server Name (Hostname)
  - IP Address
  - FQDN
  - Operating System
  - Description
- Exports the gathered data to a CSV file.

## Usage

1. Make sure you have the Active Directory module installed.
2. Run the script with the `-OutputPath` parameter specifying the path for the CSV output.

```powershell
.\Export-ServerInfo.ps1 -OutputPath "C:\path\to\output.csv"
```

## Requirements

- Active Directory module for PowerShell.
- Sufficient permissions to query Active Directory.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
