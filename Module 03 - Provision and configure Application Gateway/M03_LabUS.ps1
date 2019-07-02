<#

Superadmins Workshop - Deploy globally available application
Module 03 - Provision and configure Application Gateway

#>

# Define variables
$LocationUS      = ''
$ResourceGroup   = ''
$AppGwUS         = ''
$vNetNameUS      = "$AppGwUS-vNet"
$AddressSpaceUS  = "10.120.0.0/16"
$SubnetIPRangeUS = '10.120.1.0/24'
$SubnetNameUS    = 'AppGwSubnet'

# Create virtual network and subnet for application gateway
$vNetwork = New-AzVirtualNetwork -ResourceGroupName $ResourceGroup -Name $vNetNameUS -AddressPrefix $AddressSpaceUS -Location $LocationUS
Add-AzVirtualNetworkSubnetConfig -Name $SubnetNameUS -VirtualNetwork $vNetwork -AddressPrefix $SubnetIPRangeUS
Set-AzVirtualNetwork -VirtualNetwork $vNetwork

#Create static public IP for Application Gateway frontend
$AppGwPIP = New-AzPublicIpAddress -ResourceGroupName $ResourceGroup -name "$AppGwUS-pip" -Location $LocationUS -AllocationMethod Static -Sku Standard

# Set Application Gateway parameters
$vNet = Get-AzvirtualNetwork -Name $vNetNameUS -ResourceGroupName $ResourceGroup
$AppGwSubnet = Get-AzVirtualNetworkSubnetConfig -Name $SubnetNameUS -VirtualNetwork $vNet
$IPConfig = New-AzApplicationGatewayIPConfiguration -Name "IPConfig" -Subnet $AppGwSubnet
$FrontendIPConfig = New-AzApplicationGatewayFrontendIPConfig -Name "FrontendIPConfig" -PublicIPAddress $AppGwPIP
$BackendPool = New-AzApplicationGatewayBackendAddressPool -Name "WebAppPool" -BackendFqdns 'wladinhowebus.azurewebsites.net'
$FrontendPort = New-AzApplicationGatewayFrontendPort -Name "HTTP" -Port 80
$Listener = New-AzApplicationGatewayHttpListener -Name "WebAppListener" -Protocol Http -FrontendIPConfiguration $FrontendIPConfig -FrontendPort $FrontendPort
$Setting = New-AzApplicationGatewayBackendHttpSettings -Name "WebAppHTTPsetting" -Port 443 -Protocol Https -CookieBasedAffinity Disabled
$AppGwRule = New-AzApplicationGatewayRequestRoutingRule -Name "WebAppRule" -RuleType 'Basic' -BackendHttpSettings $Setting -HttpListener $Listener -BackendAddressPool $BackendPool
$Sku = New-AzApplicationGatewaySku -Name Standard_v2 -Tier Standard_v2
$AutoscaleConfig = New-AzApplicationGatewayAutoscaleConfiguration -MinCapacity 2

# Create Application Gateway
$AppGwParameters = @{
    Name                          = "$AppGwUS"
    ResourceGroupName             = $ResourceGroup
    Zone                          = 1, 2, 3
    FrontendPorts                 = $FrontendPort
    FrontendIpConfigurations      = $FrontendIPConfig
    BackendAddressPools           = $BackendPool
    RequestRoutingRules           = $AppGwRule
    BackendHttpSettingsCollection = $Setting
    GatewayIpConfigurations       = $IPConfig
    Location                      = $LocationUS
    HttpListeners                 = $Listener
    AutoscaleConfiguration        = $AutoscaleConfig
    Sku                           = $sku
}
New-AzApplicationGateway @AppGwParameters

# Configure custom probe that will be used for App Service
$AppGw = Get-AzApplicationGateway -Name $AppGwUS -ResourceGroupName $ResourceGroup
$AppGw | Add-AzApplicationGatewayProbeConfig -Name "CustomProbe" -Protocol Https -PickHostNameFromBackendHttpSettings -Interval 30 -Timeout 30 -Path / -UnhealthyThreshold 3
$CustomProbe = Get-AzApplicationGatewayProbeConfig -Name "CustomProbe" -ApplicationGateway $AppGw
Set-AzApplicationGatewayBackendHttpSettings -Name "WebAppHTTPsetting" -ApplicationGateway $AppGW -Protocol Https -Port 443 -Probe $CustomProbe -PickHostNameFromBackendAddress -CookieBasedAffinity "Disabled"
Set-AzApplicationGateway -ApplicationGateway $AppGw