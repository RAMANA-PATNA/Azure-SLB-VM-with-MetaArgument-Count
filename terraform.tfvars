## Generic input vaiables 
business_devision       = "hr"
envirnoment             = "dev"
resource_group_name     = "rg"
resource_group_location = "Australia Central"

# Vnet input varibles
vnet_name             = "Vnet"
vnet_address_space    = ["10.1.0.0/16"]

web_subnet_name       = "websubnet"
web_address_space     = ["10.1.1.0/24"]

app_subnet_name       = "appsubnet"
app_address_space     = ["10.1.11.0/24"]

db_subnet_name        = "dbsubnet"
db_address_space      = ["10.1.21.0/24"]

bastion_subnet_name   = "bastionsubnet"
bastion_address_space = ["10.1.100.0/24"]

# Web linux VM input variables
web_linuxvm_instance_count  = 5
lb_inbound_nat_ports= ["1022", "2022", "3022", "4022", 5022]