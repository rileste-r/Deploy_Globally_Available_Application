# Module 01 - Prepare database layer

#### Exercise 1 - Provision Azure Logical SQL Server

In this exercise, you will create SQL Logical server in Azure, that will be able to host databases.

1. In Azure portal, click to **+ Create a resource** in right top corner of portal

2. In search box type **SQL server (logical server)**, and on SQL server (logical server) wizard page click to **Create**

3. Create new SQL server using following parameters:

   - **Server name:** Must be unique
   - **Server admin login:** Define admin login username
   - **Password:** Define password
   - **Subscription:** Select your subscription
   - **Resource group:** Select resource group where you want to deploy resource
   - **Location:** Select Azure region. Recommended is any of European regions
   - All other setting leave on default values and click to **Create**

   

#### Exercise 2 - Create database for application

1. In Azure portal, click to **+ Create a resource** in right top corner of portal

2. In Azure Marketplace pane, select **Databases** and then click to **SQL Database**

3. On tab **Basics** in **PROJECT DETAILS** define following:

   - **Subscription:** Select your subscription
   - **Resource group:** Select resource group where you want to deploy resource

4. # On tab **Basics** in **DATABASE DETAILS** define following:

   - **Database name:** Define database name
   - **Server:** Select SQL server that you have created in *Exercise 1*
   - All other setting leave on default values and click to **Review + create**

5. On **Review + create** tab, validate your configuration and click to **Create**



#### Exercise 3 - Provision Azure Logical SQL Server in different region

1. In Azure portal, click to **+ Create a resource** in right top corner of portal

2. In search box type **SQL server (logical server)**, and on SQL server (logical server) wizard page click to **Create**

3. Create new SQL server using following parameters:

   - **Server name:** Must be unique
   - **Server admin login:** Define admin login username
   - **Password:** Define password
   - **Subscription:** Select your subscription
   - **Resource group:** Select resource group where you want to deploy resource
   - **Location:** Select different Azure region then selected in *Exercise 1*. Recommended is any of US regions
   - All other setting leave on default values and click to **Create**

   

#### Exercise 4 - Configure geo-replication for Azure SQL database

1. In Azure portal search bar, type **SQL servers** and select SQL server that you have created in *Exercise 1*
2. In left pane of SQL server, select **Failover groups** under the **Settings**
3. In Failover groups pane select **+ Add group** and create new failover group based on following parameters:
   - **Failover group name:** Must be unique
   - **Secondary server:** Select SQL server that is created in *Exercise 3*
   - **Database within the group**: Select databases that you want to be replicated. In this case, that is database created in *Exercise 2*
   - All other setting leave on default values and click to **Create**



At the end of this exercise, you will have geo-replicated SQL database for your application.