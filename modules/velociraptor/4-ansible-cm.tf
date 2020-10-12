  resource "null_resource" "ansible-test" {
  
    provisioner "remote-exec" {
        inline = ["echo 'Hello World'"]

    connection {
      host     = azurerm_public_ip.velociraptor-external.ip_address
      type     = "ssh"
      user     = "vadmin"
      private_key = tls_private_key.example_ssh.private_key_pem
      timeout  = "3m"
    }
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${path.module}/hosts.cfg' --private-key '${path.module}/ssh_key.pem' '${path.module}/playbook.yml'"
  }

  ## config file download after adding client paramter for trusting self-signed cert
  ## this is necessary for current convenience
  provisioner "local-exec" {
    command = "scp -i ${path.module}/ssh_key.pem vadmin@${azurerm_public_ip.velociraptor-external.ip_address}:/home/vadmin/server.config.yaml ${path.module}/files/config.yaml"
  }

    depends_on = [azurerm_linux_virtual_machine.velociraptor_vm]
  }
