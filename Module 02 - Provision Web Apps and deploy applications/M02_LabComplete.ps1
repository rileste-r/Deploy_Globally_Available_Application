<#

Superadmins Workshop - Deploy globally available application
Module 02 - Provision Web Apps and deploy applications

#>

# Define variables
$ServicePlanEU = ''
$WebAppEU      = "$ServicePlanEU"
$ServicePlanUS = ''
$WebAppUS      = "$ServicePlanUS"
$LocationEU    = ''
$LocationUS    = ''
$ResourceGroup = ''

# Create an App Service plan in standard tier and web app in European Azure region
New-AzAppServicePlan -Name $ServicePlanEU -Location $LocationEU -ResourceGroupName $ResourceGroup -Tier "Standard" -WorkerSize "Small"
New-AzWebApp -Name "$WebAppEU" -Location $LocationEU -AppServicePlan $ServicePlanEU -ResourceGroupName $ResourceGroup

# Deploy code to Web App using External Git
$GitRepo = "https://github.com/PremiumEducation/AdatumWebApp"

$PropertiesObject = @{
    repoUrl = "$GitRepo";
    branch = "master";
    isManualIntegration = $true
    }

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroup -ResourceType 'Microsoft.Web/sites/sourcecontrols' -ResourceName $WebAppEU/web -ApiVersion 2018-02-01 -Force

# Create an App Service plan in standard tier and web app in US Azure region
New-AzAppServicePlan -Name $ServicePlanUS -Location $LocationUS -ResourceGroupName $ResourceGroup -Tier "Standard" -WorkerSize "Small"
New-AzWebApp -Name "$WebAppUS" -Location $LocationUS -AppServicePlan $ServicePlanUS -ResourceGroupName $ResourceGroup

# Deploy code to Web App using External Git
$GitRepo = "https://github.com/PremiumEducation/AdatumWebApp"

$PropertiesObject = @{
    repoUrl = "$GitRepo";
    branch = "master";
    isManualIntegration = $true
    }

Set-AzResource -PropertyObject $PropertiesObject -ResourceGroupName $ResourceGroup -ResourceType 'Microsoft.Web/sites/sourcecontrols' -ResourceName $WebAppUS/web -ApiVersion 2018-02-01 -Force
