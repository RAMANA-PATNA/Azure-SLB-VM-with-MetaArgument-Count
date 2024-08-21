# Resource 1 : Create Public ip address for Azure Load balancer
resource "azurerm_public_ip" "web_lbpublicip" {
  name = "${local.resource_name_prefix}-lb-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
  sku = "Standard"
  tags = local.comman_tags
}

# Resource 2 : Create Azure Standard Load balancer
resource "azurerm_lb" "web_lb" {
  name = "${local.resource_name_prefix}-web-lb"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  sku = "Standard"

  frontend_ip_configuration {
    name = "web-lb-pulicip-1"
    public_ip_address_id = azurerm_public_ip.web_lbpublicip.id
  }
}

# Resource 3 : Create LB backend pool
resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  name = "web-backend"
  loadbalancer_id = azurerm_lb.web_lb.id
}

# Resource 4 : Create LB probe
resource "azurerm_lb_probe" "web_lb_probe" {
  name = "tcp-probe"
  protocol = "Tcp"
  port = 80
  loadbalancer_id = azurerm_lb.web_lb.id
}

# Resource 5 : Create lb rule
resource "azurerm_lb_rule" "web_lb_rule_app1" {
  name = "web-app1-rule"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  loadbalancer_id = azurerm_lb.web_lb.id
  probe_id = azurerm_lb_probe.web_lb_probe.id
}

## Resource 6 : Associate Network INterface and Standard load balancer
resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
  count = var.web_linuxvm_instance_count
  network_interface_id = element(azurerm_network_interface.web_linuxvm_nic[*].id, count.index)
  ip_configuration_name = azurerm_network_interface.web_linuxvm_nic[count.index].ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id
}

