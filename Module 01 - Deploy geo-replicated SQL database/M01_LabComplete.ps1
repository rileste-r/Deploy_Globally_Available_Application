<#

Superadmins Workshop - Deploy globally available application
Module 01 - Deploy geo-replicated SQL database

#>

# Define variables
$SQLServerEU       = ''
$SQLServerUS       = ''
$FailoverGroupName = ''
$DatabaseName      = ''
$LocationEU        = ''
$LocationUS        = ''
$ResourceGroup     = ''

# Create admin credentials
$adminUsername = Read-Host 'Admin username'
$adminPassword = Read-Host -AsSecureString 'Admin password with least 12 characters'
$adminCreds = New-Object PSCredential $adminUsername, $adminPassword

# Create a SQL Server in European Azure region
New-AzSqlServer -ResourceGroupName $ResourceGroup -ServerName $SQLServerEU -Location $LocationEU -SqlAdministratorCredentials $adminCreds

# Create a database in vCore model
New-AzSqlDatabase -ResourceGroupName $ResourceGroup -ServerName $SQLServerEU -DatabaseName $DatabaseName -Edition "GeneralPurpose" -Vcore 2 -ComputeGeneration "Gen5" -SampleName 'AdventureWorksLT'

# Create a SQL server in US Azure region
New-AzSqlServer -ResourceGroupName $ResourceGroup -ServerName $SQLServerUS -Location $LocationUS -SqlAdministratorCredentials $adminCreds

# Create a failover group
New-AzSqlDatabaseFailoverGroup -ServerName $SQLServerEU -ResourceGroupName $ResourceGroup -PartnerServerName $SQLServerUS -PartnerResourceGroupName $ResourceGroup -FailoverGroupName $FailoverGroupName -FailoverPolicy Automatic -GracePeriodWithDataLossHours 1

# Add database to failover group
$Database = Get-AzSqlDatabase -DatabaseName $DatabaseName -ResourceGroupName $ResourceGroup -ServerName $SQLServerEU
Add-AzSqlDatabaseToFailoverGroup -Database $Database -ServerName $SQLServerEU -ResourceGroupName $ResourceGroup -FailoverGroupName $FailoverGroupName