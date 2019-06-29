# Module 02 - Provisioning App service plan / Web App and deploy applications

In this module, you will create App Service plan and Web App, that will host your application.

### Exercise 1 - Provision App Service plan for hosting Web App(s)

1. In Azure portal, click to **+ Create a resource** in right top corner of portal
2. In search box type **App Service Plan**, and on App Service Plan wizard page click to **Create**
3. On the **Basics** tab under **PROJECT DETAILS** define following:
   - **Subscription:** Select your subscription
   - **Resource group:** Select resource group where you want to deploy resource
4. On the **Basics** tab under **APP SERVICE PLAN DETAILS** define following:
   - **Name:** Define name of your App Service plan
   - **Operating System:** Select *Windows*
   - **Region:** Select Azure region. Recommended is any of European regions
5. On the **Basics** tab under **PRICING TIER** define following:
   - **Sku and size:** Select *Standard S1*
6. Select **Review and create**
7. On the **Review and create** tab, click on **Create**

### Exercise 2 - Provision Web App that will host your application

1. In Azure portal, click to **+ Create a resource** in right top corner of portal
2. In Azure Marketplace pane select **Web** and then click to **Web App**
3. On the **Basics** tab under **PROJECT DETAILS** define following:
   - **Subscription:** Select your subscription
   - **Resource group:** Select resource group where you want to deploy resource
4. On the **Basics** tab under **INSTANCE DETAILS** define following:
   - **Name:** Name of your application. Must be unique
   - **Publish:** Select *Code*
   - **Runtime stack:** Select *ASP.NET v4.7*
   - **Operating System:** Select *Windows*
   - **Region:** Select Azure region that is used in *Exercise 1*
5. On the **Basics** tab under **APP SERVICE PLAN** select plan that is created in *Exercise 1*
6. Select **Review and create**
7. On the **Review and create** tab, click on **Create**

### Exercise 3 - Deploy application to Web App

There are few different ways to deploy code of your application to Web App and make application visible on the internet. You can use Visual Studio, FTP, Azure DevOps and many different ways, but for simplification, in this exercise we will deploy code directly from Git repositorium.

Information about other deploying methods, you can find on following links

<https://docs.microsoft.com/en-us/azure/app-service/deploy-zip>

<https://docs.microsoft.com/en-us/azure/app-service/deploy-ftp>

<https://docs.microsoft.com/en-us/azure/app-service/deploy-content-sync>

<https://docs.microsoft.com/en-us/azure/app-service/deploy-continuous-deployment>

1. In Azure portal search bar, type **App Services** and select the Web App that you created in *Exercise 2*
2. In left pane of App Service, select **Deployment Center** under **Deployment**
3. On **Source control** page, select **External** and click **Continue**
4. On **Build provider** page, select **App Service build service** and click **Continue**
5. On **Configure** page, under the **Code**, define following parameters and click **Continue** 
   - **Repository:** https://github.com/PremiumEducation/AdatumWebApp
   - **Branch:** master
   - **Repository Type:** Git
6. On **Summary** page validate configuration and click **Finish**

Once deployment is configured, in most cases within 30 seconds, you will be able to see deployment status. If code is successfully deployed, your application will be visible from the internet.

**NOTE:** All of these exercises need to be performed again, in order to configured same web application in different Azure region.

------

**!!! At the end of this module, you will have deployed the same web application to different Azure regions. !!!**