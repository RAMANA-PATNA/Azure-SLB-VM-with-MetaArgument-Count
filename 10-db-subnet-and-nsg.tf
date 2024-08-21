# Resource Create DB subnet 
resource "azurerm_subnet" "dbsubnet" {
  name = "${local.resource_name_prefix}-${var.db_subnet_name}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = var.db_address_space
}

# Resource Create Network Security Group
resource "azurerm_network_security_group" "db_subnet_nsg" {
  name = "${azurerm_subnet.dbsubnet.name}-nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

# Resource Associate Network Security Group With subnet
resource "azurerm_subnet_network_security_group_association" "db_subnet_nsg_associate" {
  depends_on = [ azurerm_network_security_rule.db_nsg_rule_inbound ]
  subnet_id = azurerm_subnet.dbsubnet.id
  network_security_group_id = azurerm_network_security_group.db_subnet_nsg.id
}

# Reosurce Create Security rules for Network Security Group
## Create local blocks for security rules
locals {
  db_inbound_ports_map = {
    "100" : "3306",
    "110" : "1433"
    "120" : "5432"
  }
}
resource "azurerm_network_security_rule" "db_nsg_rule_inbound" {
    for_each = local.db_inbound_ports_map
    name = "Rule-Port-${each.value}"
    direction = "Inbound"
    priority = each.key
    protocol = "Tcp"
    access = "Allow"
    source_port_range = "*"
    destination_port_range = each.value
    source_address_prefix = "*"
    destination_address_prefix = "*"
    resource_group_name = azurerm_resource_group.rg.name
    network_security_group_name = azurerm_network_security_group.db_subnet_nsg.name  
}