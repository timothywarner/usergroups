# Authenticate to ARM
Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionName '150dollar'
Set-AzureRmContext -SubscriptionId 7be05db5-0dea-4ffe-b309-ebbc94f0684e

# Create resource group
New-AzureRmResourceGroup -Name ARMResourceGroup -Location 'South Central US'

# Create app service plan
New-AzureRmAppServicePlan -ResourceGroupName 'ARMResourceGroup' -Name 'ARMServicePlan' -Location 'South Central US' -Tier Standard -NumberofWorkers 1 -WorkerSize 'Small'

Set-Location -Path 'G:\azure-quickstart-templates\201-web-app-github-deploy'

psedit '.\azuredeploy.json'

psedit '.\azuredeploy.parameters.json'

New-AzureRmResourceGroupDeployment -Name TestDeployment `
-ResourceGroupName ARMResourceGroup `
-TemplateFile '.\azuredeploy.json' `
-TemplateParameterFile '.\azuredeploy.parameters.json'

# List app service plans
Get-AzureRmAppServicePlan -ResourceGroupName 'ARMResourceGroup'

# Scale up a service plan to a higher pricing tier
Set-AzureRmAppServicePlan -Name 'ARMServicePlan' -ResourceGroupName 'ARMResourceGroup' -Tier Standard






# Scale out to more than one instance


