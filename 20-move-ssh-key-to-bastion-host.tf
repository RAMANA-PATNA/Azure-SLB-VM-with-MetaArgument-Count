## Create Null resource and provisiones
resource "null_resource" "name" {
  depends_on = [ azurerm_linux_virtual_machine.bastion_host_linuxvm ]
  ## connection block for provisioner to connect to Azure VM instance

  connection {
    type = "ssh"
    host = azurerm_linux_virtual_machine.bastion_host_linuxvm.public_ip_address
    user = azurerm_linux_virtual_machine.bastion_host_linuxvm.admin_username
    private_key = file("${path.module}/ssh-keys/terraform-azure.pem")
  }

  # File provisioner : copy the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source = "ssh-keys/terraform-azure.pem"
    destination = "/tmp/terraform-azure.pem"
  }

  ## Remote exec provisioner : Using remote exce provisioner to fix the private key provisioner on bastionhost
  provisioner "remote-exec" {
    inline = [ "sudo chmod 400 /tmp/terraform-azure.pem" ]
  }
}