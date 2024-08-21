# Virtual Network Outputs
## Virtual Network name
output "virtual_network_name" {
  description = "Virtual Network Name"
  value = azurerm_virtual_network.vnet.name
}

## Virtual Network Id
output "virtual_network_id" {
  description = "Virtual Network Id"
  value = azurerm_virtual_network.vnet.id
}

## Web subnet name
output "web_subnet_name" {
  description = "Web subnet name"
  value = azurerm_subnet.websubnet.name
}

## Web subnet id
output "web_subnet_id" {
  description = "web subnet id"
  value = azurerm_subnet.websubnet.id
}

## Network Security Group Outputs
output "web_subnet_nsg_name" {
  description = "web  network security group name"
  value = azurerm_network_security_group.web_subnet_nsg.name
}

## Network security Group id
output "web_subnet_nsg_id" {
  description = "web  network security group id"
  value = azurerm_network_security_group.web_subnet_nsg.id
}