# Network Interface outputs
## Network Interface Id
output "web_linuxvm_network_interface_id" {
  description = "Web Linux VM Network Interface ID"
  value = azurerm_network_interface.web_linuxvm_nic[*].id
}

## Network Interface Private IP address
output "web_linuxvm_network_interface_private_ip_addresses" {
  description = "web Linux VM network interface private ip addresses"
  value = [azurerm_network_interface.web_linuxvm_nic[*].private_ip_addresses]
}

## Virtual Machine Private Ip
output "web_linuxvm_private_ip_addresses" {
  description = "Web linux VM private ip addresses"
  value = [azurerm_linux_virtual_machine.web_linuxvm[*].private_ip_addresses]
}

## Virtual machine 128-bit ID
output "web_linuxvm_virtual_machine_128_bit_id" {
  description = "web linux Virtual Machine ID 128-bit identifier"
  value = azurerm_linux_virtual_machine.web_linuxvm[*].virtual_machine_id
}

## Virtual Machine ID
output "web_linuxvm_virtual_machine_id" {
  description = "Web linux VM virtual Machine is"
  value = azurerm_linux_virtual_machine.web_linuxvm[*].id
}