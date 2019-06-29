## Deploy globally available application on the Azure platform

Setting up a web application on the Azure platform today is no longer a "rocket science". If you decide to use Azure PaaS (App Service, Function App, Logic App ...), the process will be simplified and your application can be available to users around the world in a short time. But .... If your application need to scalable and highly available, especially in the case of failure of the entire region, you need to implement additional services that will help you to achieve that goal.

This workshop will cover services needed to implement a globally highly available application.

 - Azure SQL Server
 - App Service
 - Load Balancer or Application Gateway
 - Traffic Manager



At the end of this workshop, you should have deployed globally available application, based on the following infrastructure diagram.

```
<p align="center">
  <img width="460" height="300" src="https://raw.githubusercontent.com/PremiumEducation/Deploy_Globally_Available_Application/master/GloballyAvailableApplication.PNG">
</p>
```

Let's start with deploying ! ! !

