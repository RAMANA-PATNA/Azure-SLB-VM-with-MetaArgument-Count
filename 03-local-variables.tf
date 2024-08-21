# Local block
locals {
  owners = var.business_devision
  envirnoment = var.envirnoment
  resource_name_prefix = "${var.business_devision}-${var.envirnoment}"

  comman_tags = {
    owners = local.owners
    envirnoment = local.envirnoment
  }
}