## Bastion service host outputs
output "bastion_host_linuxvm_public_ip_address" {
  description = "Bastion Host Linux VM public ip address"
  value = azurerm_public_ip.bastion_host_publicip.ip_address
}