# Generic input variables
variable "business_devision" {
  type = string
  default = "sap"
}

# Envirnoment variable
variable "envirnoment" {
  type = string
  default = "dev"
}

# Resource Group variable
variable "resource_group_name" {
  type = string
  default = "rg"
}

# Resource Group Location variable
variable "resource_group_location" {
  type = string
  default = "Australia Central"
}