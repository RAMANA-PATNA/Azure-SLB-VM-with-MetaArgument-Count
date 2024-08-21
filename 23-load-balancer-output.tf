## LB public ip
output "web_lb_public_ip_address" {
  description = "web loadbancer public ip address"
  value = azurerm_public_ip.web_lbpublicip.ip_address
}

# Load Balancer ID
output "web_lb_id" {
  description = "web load balancer id"
  value = azurerm_lb.web_lb.id
}

# Load balancer front end ip address configuration name
output "web_lb_frontend_ip_configuration" {
  description = "web load balancer front ip configuration"
  value = azurerm_lb.web_lb.frontend_ip_configuration
}