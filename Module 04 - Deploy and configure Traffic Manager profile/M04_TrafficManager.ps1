<#

Superadmins Workshop - Deploy globally available application
Module 04 - Deploy and configure Traffic Manager profile

#>

# Define variables
$ResourceGroup      = ''
$TrafficManagerName = ''
$EndpointEU         = ''
$WebAppNameEU       = ''
$WebAppEU           = Get-AzWebApp -ResourceGroupName $ResourceGroup -Name $WebAppNameEU
$EndpointUS         = ''
$WebAppNameUS       = ''
$WebAppUS           = Get-AzWebApp -ResourceGroupName $ResourceGroup -Name $WebAppNameUS


# Create a Traffic Manager profile
$TrafficManager = New-AzTrafficManagerProfile -Name $TrafficManagerName -ResourceGroupName $ResourceGroup -TrafficRoutingMethod Priority -RelativeDnsName $TrafficManagerName -Ttl 60 -MonitorProtocol HTTP -MonitorPort 80 -MonitorPath /

# Create an endpoint for the European Web App
New-AzTrafficManagerEndpoint -Name $EndpointEU -ProfileName $TrafficManager.Name -ResourceGroupName $ResourceGroup -Type AzureEndpoints -Priority 1 -TargetResourceId $WebAppEU.Id -EndpointStatus Enabled

# Create an endpoint for the US Web App
New-AzTrafficManagerEndpoint -Name $EndpointUS -ProfileName $TrafficManager.Name -ResourceGroupName $ResourceGroup -Type AzureEndpoints -Priority 2 -TargetResourceId $WebAppUS.Id -EndpointStatus Enabled
