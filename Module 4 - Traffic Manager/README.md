# Module 04 - Deploy and configure Traffic Manager

In this module, you will deploy and configure Traffic Manager, in order to make your web application globally available.

### Exercise 1 - Provision Traffic Manager profile

1. In Azure portal, click to **+ Create a resource** in right top corner of portal
2. In search box type **Traffic Manager profile**, and on Traffic Manager profile wizard page click to **Create**
3. Create new Traffic Manager profile using following parameters:
   - **Name:** Must be unique
   - **Routing method:** Performance
   - **Subscription:** Select your subscription
   - **Resource group:** Select resource group where you want to deploy resource
   - Click to **Create**

### Exercise 2 - Configure Traffic Manager

1. In Azure portal search box, type **Traffic Manager profiles** and select created Traffic Manager profile
2. In Traffic Manager profile left pane, select **Endpoints** under **Settings** and click to **+ Add**
3. In **Add endpoint** wizard page, configure endpoint using following parameters:
   - **Type:** Azure endpoint
   - **Name:** EU WebApp
   - **Target resource type:** App Service
   - **Target resource:** WebApp created in European Azure region
4. Add additional endpoint by performing the same procedure as in *step 3*, using following parameters:
   - **Type:** Azure endpoint
   - **Name:** US WebApp
   - **Target resource type:** App Service
   - **Target resource:** WebApp created in US Azure region

Once you created endpoints, your web application will be globally available by using Traffic Manager profile FQDN. FQDN of Traffic Manager profile is visible in the right column of Traffic Manager profile resource overview pane, under **DNS name** parameter. 

------

**!!! At the end of this module, your application is globally available by using Traffic Manager profile DNS name. !!!**