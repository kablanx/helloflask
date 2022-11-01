param locationApp string
param nameappserviceplan string

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: '${nameappserviceplan}service'
  location: locationApp
  sku: {
    name: 'F1'
    capacity: 1
  }
  kind: 'linux' 
}

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: '${nameappserviceplan}web'
  location: locationApp
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: appServicePlan.id
  }
}
