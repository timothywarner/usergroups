## **SQLSaturday Nashville 2017
January 14, 2017** ##

****Convert Excel .xls to .csv****
1 - Open an elevated PowerShell session

2 - Load the **ConvertXLStoCSV.psm1** module (source):

`Import-Module -Path 'C:\tmp\ConvertXLStoCSV.psm1'`

3 - Temporarily unlock your computer's PowerShell script execution policy:

`Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force`

4 - Run the script. It's pretty basic, but gets the job done:

`.\ConvertXLStoCSV.ps1 -Path 'C:\tmp\testworksheet.xlsx'` 

5 - This may be a [more robust solution](https://blogs.technet.microsoft.com/heyscriptingguy/2015/11/25/introducing-the-powershell-excel-module-2/)

****Import CSV into a SQL Server table****
1 - Open an elevated PowerShell session

2 - Edit the following code to suit your environment (source):

```
$ConnectionString = "Data Source=L80\SQL2012; Database=tempdb; Trusted_Connection=True;";
. ".\Out-DataTable.ps1"

$csvDataTable = Import-CSV -Path ".\SimpleCsv.txt" | Out-DataTable
$bulkCopy = new-object ("Data.SqlClient.SqlBulkCopy") $ConnectionString
$bulkCopy.DestinationTableName = "CsvDataReader"
$bulkCopy.WriteToServer($csvDataTable)
```

Once again, the preceding is just one of many ways to solve the problem; I give you the above solution due to its simplicity.

****'Refresh' a PowerShell variable****
1 - Try this:

```
$s = Get-Service -Name Spooler
$s
$s.Stop()
$s
```
2 - You'll find that repeatedly calling the `$s` variable doesn't update its contents.

3 - Turns out, this is expected behavior. I guess the overhead it would cause Windows to auto-refresh variable values would be crippling.

Some objects have a built-in `Refresh()` method you can call:

`$s.Refresh()`
