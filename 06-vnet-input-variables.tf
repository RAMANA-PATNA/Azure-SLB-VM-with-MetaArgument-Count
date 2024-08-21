## Virtual Network Input variables
variable "vnet_name" {
  type = string
  default = "vnet"
}

# Virtual network address space
variable "vnet_address_space" {
  type = list(string)
  default = [ "10.0.0.0/16" ]
}

#Subnet input variables
## Web subnet name
variable "web_subnet_name" {
  type = string
  default = "web-subnet"
}

# Web subnet address space
variable "web_address_space" {
  type = list(string)
  default = [ "10.0.1.0/24" ]
}

## App subnet name
variable "app_subnet_name" {
  type = string
  default = "app-subnet"
}

## App address space
variable "app_address_space" {
  type = list(string)
  default = [ "10.0.11.0/24" ]
}

## Db subnet name
variable "db_subnet_name" {
  type = string
  default = "db-subnet"
}

## Db address space
variable "db_address_space" {
  type = list(string)
  default = [ "10.0.21.0/24" ]
}

## Bastion subnet name
variable "bastion_subnet_name" {
  type = string
  default = "bastion-subnet"
}

## Bastion address space
variable "bastion_address_space" {
  type = list(string)
  default = [ "10.0.100.0/24" ]
}