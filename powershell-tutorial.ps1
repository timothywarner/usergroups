break
# #############################################################################
# A Real, Live PowerShell Tutorial
# EMAIL: timothywarner316@gmail.com
# WEB: timwarnertech.com
# THIS FILE: github.com/timothywarner/?
# #############################################################################
 
# Press CTRL+M to expand/collapse regions

# Check your PowerShell version
$PSVersionTable.PSVersion

# Check your available modules
Get-Module -ListAvailable

# Update your local help
Update-Help -ErrorAction SilentlyContinue

# Discover some commands
Get-Command -Noun Get

# Obtain some help
Get-Help -Name Get-ChildItem -ShowWindow

# Understand aliases
Get-Alias -Name dir
Get-Alias -Name ls

# Investigate members
Get-Service -Name Spooler
Get-Service -Name Spooler | Get-Member
$spool = Get-Service -Name Spooler
$spool.Status
$spool.Stop()

# Check the pipeline
Get-Service -Name Spooler | Start-Service

Get-ChildItem -Path 'C:\Windows\System32' -Filter *.dll -Recurse

Get-ChildItem -Path 'C:\Windows\System32' -Recurse | Where-Object -FilterScript { $_.Extension -eq 'dll' } 

Get-Service | Select-Object -Property Name, Status

# Explore PSDrives
Get-PSDrive

# Connect to Azure IaaS SQL Server VM

# Browse the SQL Server PSDrive

# Run a SQL script

# Run an ad-hoc T-SQL query

# Run a stored procedure
