# Module 03 - Provision and configure Application Gateway in front of web applications

In this module, you will create Application Gateway, as a load balancing solution, that will sits on front of your previously created web applications.

### Exercise 1 - Provision and configure Application Gateway

1. In Azure portal, click to **+ Create a resource** in right top corner of portal
2. In Azure Marketplace pane select **Networking** and then click to **Application Gateway**
3. Click on **Preview the new creation experience for Application Gateway** on **Create an application gateway** pane
4. On **Basics** tab under **PROJECT DETAILS** define following: 
   - **Subscription:** Select your subscription
   - **Resource group:** Select resource group where you want to deploy resource
5. On **Basics** tab under **INSTANCE DETAILS** define following: 
   - **Application gateway name:** Define application gateway name
   - **Region:** Select Azure region that is used for deploying European Web App
   - All other settings leave on default value
6. On **Basics** tab under **CONFIGURE VIRTUAL NETWORK** select **Create new** using following parameters: 
   - **Name:** Define virtual network name
   - **ADDRESS RANGE** under **ADDRESS SPACE:** 10.123.0.0/16
   - **SUBNET NAME** under **SUBNETS:** Leave defaults
   - **ADDRESS RANGE** under **SUBNETS:** 10.123.1.0/24
   - Click **OK**
7. Select **Next: Frontends**
8. On **Frontends** tab, check **Public** under **Frontend IP address type**
9. On **Frontends** tab, select **Create new** under **Public IP address** and define name
10. Select **Next: Backends**
11. On **Backends** tab click to **+ Add a backend pool** and create backend pool using following parameters:
    - **Name:** WebAppPool
    - **TARGET TYPE:** App Services
    - **TARGET:** European Web App
12. Click **Add** and select **Next : Configuration**
13. On **Configuration** tab click to **+ Add a routing rule** and create rule using following parameters:
    - **Rule name:** WebAppRule
    - **Listener name (Listener):** WebAppListener
    - **Frontend IP (Listener):** Public
    - **Protocol (Listener):** HTTP
    - **Port (Listener):** 80
    - Other **Listener** setting leave on default values and switch to **Backend targets** configuration
    - **Backend target (Backend targets):** WebAppPool
    - **HTTP setting**: Click to **Create new** and create using following parameters:
      - **HTTP setting name:** WebAppHTTPsetting
      - **Backend protocol:** Https
      - **Backend port:** 443
      - **Use for App service:** Yes
      - All other setting leave on default values and click **Add** twice
14. Select **Next : Tags**
15. On tab **Tags** select **Next : Review + create**
16. On tab **Review + create** click to **Create**

> ***NOTE:*** *Deployment of Application Gateway will take up to 25 minutes. While you wait for deploying Application Gateway perform Exercise 2, in order to create Application Gateway for different Web App.*

### Exercise 2 - Provision and configure Application Gateway for second Web App and region

1. In Azure portal, click to **+ Create a resource** in right top corner of portal
2. In Azure Marketplace pane select **Networking** and then click to **Application Gateway**
3. Click on **Preview the new creation experience for Application Gateway** on **Create an application gateway** pane
4. On **Basics** tab under **PROJECT DETAILS** define following: 
   - **Subscription:** Select your subscription
   - **Resource group:** Select resource group where you want to deploy resource
5. On **Basics** tab under **INSTANCE DETAILS** define following: 
   - **Application gateway name:** Define application gateway name
   - **Region:** Select Azure region that is used for deploying US Web App
   - All other settings leave on default value
6. On **Basics** tab under **CONFIGURE VIRTUAL NETWORK** select **Create new** using following parameters: 
   - **Name:** Define virtual network name
   - **ADDRESS RANGE** under **ADDRESS SPACE:** 10.250.0.0/16
   - **SUBNET NAME** under **SUBNETS:** Leave defaults
   - **ADDRESS RANGE** under **SUBNETS:** 10.250.1.0/24
   - Click **OK**
7. Select **Next: Frontends**
8. On **Frontends** tab, check **Public** under **Frontend IP address type**
9. On **Frontends** tab, select **Create new** under **Public IP address** and define name
10. Select **Next: Backends**
11. On **Backends** tab click to **+ Add a backend pool** and create backend pool using following parameters:
    - **Name:** WebAppPool
    - **TARGET TYPE:** App Services
    - **TARGET:** US Web App
12. Click **Add** and select **Next : Configuration**
13. On **Configuration** tab click to **+ Add a routing rule** and create rule using following parameters:
    - **Rule name:** WebAppRule
    - **Listener name (Listener):** WebAppListener
    - **Frontend IP (Listener):** Public
    - **Protocol (Listener):** HTTP
    - **Port (Listener):** 80
    - Other **Listener** setting leave on default values and switch to **Backend targets** configuration
    - **Backend target (Backend targets):** WebAppPool
    - **HTTP setting**: Click to **Create new** and create using following parameters:
      - **HTTP setting name:** WebAppHTTPsetting
      - **Backend protocol:** Https
      - **Backend port:** 443
      - **Use for App service:** Yes
      - All other setting leave on default values and click **Add** twice
14. Select **Next : Tags**
15. On tab **Tags** select **Next : Review + create**
16. On tab **Review + create** click to **Create**

Once deployment is finished, you will be able to access to your web application by using public IP address of Application Gateway. To find out what public IP address is, type **Application Gateways** in Azure portal search box and select deployed Application Gateway. On the overview of Application Gateway resource, public IP address will be visible in right column under **Frontend public IP address**. 

Once you note public IP address, try to reach your web application using this public IP address.

> ***NOTE:*** *If you receive Server Error **502 - Web server received an invalid response while acting as a gateway or proxy server**, most probably one of setting is not deployed correctly. To correct this issue, perform following steps:*
>
> - *Go to the created Application Gateway*
> - *In left pane select **HTTP settings***
> - *Click on created HTTP setting to edit, and check the checkbox **Use for App service***
> - *Click **Save** and wait few minutes to update is propagate*



------

**!!! At the end of this module, you will have deployed Application Gateway, as a load balancing solution, that sits on front of your web applications. !!!**