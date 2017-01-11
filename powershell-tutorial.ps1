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

# Import the sqlps module
Import-Module -Name sqlps -DisableNameChecking

# Examine the module
Get-Command -Module sqlps | Select-Object -Property Name | Format-Wide -Column 2

Get-Help -Name Invoke-Sqlcmd -ShowWindow

# Browse the SQL Server PSDrive
Set-Location -Path SQLSERVER:\SQL\SQLnash001\Default\Databases\AdventureWorks2014

# Run an ad-hoc T-SQL query
Invoke-Sqlcmd -Query 'SELECT GETDATE() AS TimeOfQuery;' -ServerInstance 'localhost'

Invoke-Sqlcmd -Query 'SELECT DepartmentID, Name FROM HumanResources.Department ORDER BY DepartmentID;' -Database 'AdventureWorks2014' -ServerInstance 'localhost'

# Run a SQL script
Invoke-Sqlcmd -InputFile 'C:\Users\Tim\Desktop\usergroups\TestSQL.sql' | Out-File -FilePath 'C:\Users\Tim\Desktop\usergroups\TestSQL.rpt' -Force
ise 'c:\users\tim\desktop\usergroups\TestSQL.rpt'

# Convert results to CSV
Invoke-Sqlcmd -InputFile 'C:\Users\Tim\Desktop\usergroups\TestSQL.sql' | Export-Csv -Path 'C:\Users\Tim\Desktop\Usergroups\report.csv' -NoTypeInformation -Force

# Run a stored procedure
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server=localhost;Database=master;Integrated Security=True"
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = "sp_helpdb"
$SqlCmd.Connection = $SqlConnection
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd
$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet)
$SqlConnection.Close()
$DataSet.Tables[0]

# 




# Oh, about quotes...
$w = 'world!'
Clear-Host
Write-Output 'Hello $w'
Write-Output "Hello $w"
Write-Output "Hello, my 'pretty', said the Wicked Witch."
