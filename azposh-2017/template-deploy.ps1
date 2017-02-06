
New-AzureRmResourceGroup -Name 'azposhRG' -Location 'southcentralus' 

Set-Location -Path 'C:\Users\Tim\desktop\usergroups\azposh-2017'

psedit '.\azuredeploy.json'

psedit '.\azuredeploy.parameters.json'

# fetch password from Key Vault
https://github.com/Azure/azure-quickstart-templates/tree/master/101-vm-secure-password

Get-Help -Name New-AzureRmResourceGroupDeployment -ShowWindow

New-AzureRmResourceGroupDeployment -Name TestDeployment `
-ResourceGroupName 'test1' `
-TemplateFile '.\azuredeploy.json' `
-TemplateParameterFile '.\azuredeploy.parameters.json' -Verbose #-WhatIf 