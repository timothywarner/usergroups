$Credential = Get-Credential -UserName:"root" -Message:"Enter Password:"

#Ignore SSL certificate validation
$opt = New-CimSessionOption -UseSsl:$true -SkipCACheck:$true -SkipCNCheck:$true -SkipRevocationCheck:$true

#Options for a trusted SSL certificate
# $opt = New-CimSessionOption -UseSsl:$true 
$Sess=New-CimSession -Credential:$credential -ComputerName:192.168.71.143 -Port:5986 -Authentication:basic -SessionOption:$opt -OperationTimeoutSec:90

Start-DscConfiguration -Path C:\SampleConfig1 -CimSession $Sess -Wait -Verbose
