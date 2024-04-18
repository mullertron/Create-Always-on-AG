@description('The Name of the Virtual Network')
param virtualNetworkName string

@description('Location for all resources.')
param location string

@description('The Virtual Networks Address Range')
param virtualNetworkAddressRange string

@description('This is the list of Subnets')
param subnets array

@description('This is the DNS Server Address of the Virtual Network')
param DNSServerAddress array = []

param networkSecurityGroup string

var dhcpOptions = {
  dnsServers: DNSServerAddress
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        virtualNetworkAddressRange
      ]
    }
    dhcpOptions: (empty(DNSServerAddress) ? null : dhcpOptions)
    
    subnets: [for subnet in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.subnetPrefix
        networkSecurityGroup: {
          id: networkSecurityGroup
        }
      }
    }]
  }
}
