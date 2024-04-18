# Create-Always-on-AG

## Set Up Instructions

Clone this repo to your local machine

Navigate to the folder on the File System where the repo has been cloned to

Run the following commands

~~~~~
az login
~~~~~

Enter the credentials to your subscription

Create a new Resource Group with the following commands

~~~~~
az group create --name [RGName] --location [Region]
~~~~~

A new resource group will then be created in the region you chose

Run the following commands to deploy the files

~~~~~
az deployment group create --resource-group [RGName] --template-file lab04-setup.bicep
~~~~~

Note: The Deployment will take about 20 minutes to complete

You can review the deployment by clicking on the Resource group in the portal and selecting Deployments
![image](https://github.com/mullertron/Create-Always-on-AG/assets/79084450/ebec3952-f714-45f2-8764-93134b6780ab)

![image](https://github.com/mullertron/Create-Always-on-AG/assets/79084450/544e7f15-98f7-4186-83a7-22797f18ef5c)

You will see something like the following

![image](https://github.com/mullertron/Create-Always-on-AG/assets/79084450/2ea9f813-5027-4740-ab6f-a1b85f674dd3)

![image](https://github.com/mullertron/Create-Always-on-AG/assets/79084450/276451a5-d303-4f65-be95-a560a9bf90c8)

Click on the current deployment to see the progress

![image](https://github.com/mullertron/Create-Always-on-AG/assets/79084450/af69847a-07d8-416e-849c-81f6b839da89)


Once completed you will have 3 Virtual machines

- A Domain Controller
- 2 SQL VM's

Both VM's will be joined to the domain.

To log into the domain, use the credentials that were entered as paramaters when running the bicep file.
