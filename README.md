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
