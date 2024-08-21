## Web linux VM input variables
variable "web_linuxvm_instance_count" {
  description = "Web linux VM istance count"
  type = number
  default = 1
}

# Web LB inbound nat ports for All VMs
variable "lb_inbound_nat_ports" {
  description = "Web lb inbound nat ports"
  type = list(string)
  default = [ "1022", "2022", "3022", "4022", "5022" ]
}