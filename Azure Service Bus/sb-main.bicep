param resourceName string = 'sb-ab-1448' # Globally unique for Azure
param queueName string = 'queue'
param location string = 'uksouth'

resource namespace 'Microsoft.ServiceBus/namespaces@2022-01-01-preview' = {
  name: resourceName
  location: location
  sku: {
    capacity: 0
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {
    disableLocalAuth: false
    publicNetworkAccess: 'Enabled'
    zoneRedundant: false
  }
  tags: {
    test: 'test'
  }
}

resource queue 'Microsoft.ServiceBus/namespaces/queues@2021-06-01-preview' = {
  name: queueName
  parent: namespace
  properties: {
    deadLetteringOnMessageExpiration: false
    enableBatchedOperations: true
    enableExpress: false
    enablePartitioning: true
    maxDeliveryCount: 10
    maxSizeInMegabytes: 1024
    requiresDuplicateDetection: false
    requiresSession: false
    status: 'Active'
  }
  tags: {
    test: 'test'
  }
}

