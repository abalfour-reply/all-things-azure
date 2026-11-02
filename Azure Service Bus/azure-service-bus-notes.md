# <Topic Azure Service Bus> 

## Summary

A managed message broker, use when you have multiple applications or services that need to communicate reliably without being directly connected to each other.

Think of it like a reliable post office:
- Stores messages durably
- Delivers message reliabily
- Retries failed deliveries
- Allows systems to work independtly
- Handles spikes in workloads

Two types of service buses

__Queues__
First in First Out Structure. Messages are timestamped etc. Usually a n:1 relationship, messages come in and go to a designated location.

__Topics/Subscription__
A user/node publishes to a topic. From that topic you can have multiple subscribers that all attach to the topic and works just like a queue.



## Bicep Notes
I deployed a resource group using Azure CLI

I then created a bicep file (sb-main.bicep) that creates an azure service bus namespace and queue.

```bash
# Create a resource group
az group create --name rg-servicebus-test --location uscentral

# Output
{
  "id": "/subscriptions/<subscription-id>/resourceGroups/rg-servicebus-test",
  "location": "uksouth",
  "managedBy": null,
  "name": "rg-servicebus-test",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"


# Command to deploy bicep file:
az deployment group create --resource-group rg-servicebus-test --template-file sb-main.bicep


# Linking it to my .Net Application
dotnet new console -n MyAppName
cd MyAppName

# Add the Azure Service Bus SDK
dotnet add Package Azure.Messaging.ServiceBus

# Executes program.cs
dotnet run

# Delete all the resource we created today
az group delete --name rg-servicebus-test --no-wait
```
