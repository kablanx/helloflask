param resourceGroupName string
param resourceGroupLocation string
param resourceGroupService string

targetScope= 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module stg 'modulo.bicep' ={
  name: resourceGroupService
  scope: resourceGroup
  params: {
    locationApp: resourceGroupLocation
    nameappserviceplan: resourceGroupService
  }
}




