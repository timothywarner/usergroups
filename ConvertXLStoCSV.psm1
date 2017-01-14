<#
The sample scripts are not supported under any Microsoft standard support 
program or service. The sample scripts are provided AS IS without warranty  
of any kind. Microsoft further disclaims all implied warranties including,  
without limitation, any implied warranties of merchantability or of fitness for 
a particular purpose. The entire risk arising out of the use or performance of  
the sample scripts and documentation remains with you. In no event shall 
Microsoft, its authors, or anyone else involved in the creation, production, or 
delivery of the scripts be liable for any damages whatsoever (including, 
without limitation, damages for loss of business profits, business interruption, 
loss of business information, or other pecuniary loss) arising out of the use 
of or inability to use the sample scripts or documentation, even if Microsoft 
has been advised of the possibility of such damages.
#> 

Function Convert-OSCXLStoCSV
{
	<#
        .SYNOPSIS 
        Convert-OSCXLStoCSV will Convert Microsoft Excel file XLS to CSV file.

        .DESCRIPTION
        Convert-OSCXLStoCSV is to help users to convert .XLS file to .CSV file via PowerShell.

        .PARAMETER Path
        Specifies the Path of XLS file which will be converted to CSV file.
		
        .EXAMPLE
        C:\PS> Convert-OSCXLStoCSV -Path "C:\Test1.xls"
        Convert XLS file "Test1.xls" to "Test1.csv"
		
		.EXAMPLE
        C:\PS> Convert-OSCXLStoCSV -Path "C:\Test1.xls","C:\Test2.xls"
        Convert XLS files "Test1.xls","Test2.xls" to CSV format
    #>
            


	
	[CmdletBinding()]
	Param
	(
		#Define parameters
		[Parameter(Mandatory=$true,Position=0)]
		[String[]]$Path
	)
	Process
	{
		#Start for Each Path
		Foreach ($i in $Path){
			#Check the Path Exist
			If((test-path $i) -and ($i -match ".xls")){
				#Connect Excel
				$objExcel = New-Object -ComObject Excel.Application
				#Create Save Path 
				$NewPath = $i -replace ".xls",".csv"
				#Check if the new path existed
				If(Test-Path $NewPath){
					#Remove the File
					Remove-Item -Path $NewPath -Force | Out-Null
				}
				#Open XLS file in Excel
				$objworkbook = $objExcel.Workbooks.Open($i)
				#Save as XLS
				$objworkbook.SaveAs($NewPath)
				#Close Excel
				$objworkbook.Close($false)
				Write-Host "The File $i is converted to CSV file"
			}
			Else{
				Write-Error "The Path $i is not exist or $i is not a CSV File"
			}
		}
	}
}