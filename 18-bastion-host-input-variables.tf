## Bastion linux vm Host input variables
variable "bastion_host_subnet_name" {
  description = "Basrion Host Subnet name"
  type = string
  default = "AzureBastionSubnet"
}

## Bastion host Address prefixes
variable "bastion_service_address_prefixes" {
  description = "Bastion Service Address Prefixes"
  type = list(string)
  default = [ "10.0.101.0/27" ]
}