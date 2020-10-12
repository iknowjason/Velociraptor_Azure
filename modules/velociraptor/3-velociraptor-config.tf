  resource "null_resource" "velociraptor-config" {
  
  provisioner "local-exec" {
    command = "${path.module}/velociraptor config generate > ${path.module}/files/config.yaml"
  }

  ## Change client URL in config
  provisioner "local-exec" {
    command = "sed -i 's/localhost:8000/10.100.1.4:8000/g' ${path.module}/files/config.yaml"
  }

  ## Change server bind in config
  provisioner "local-exec" {
    command = "sed -i 's/bind_address: 127.0.0.1/bind_address: 10.100.1.4/g' ${path.module}/files/config.yaml"
  }

  provisioner "file" {
    source      = "${path.module}/files/config.yaml"
    destination = "/home/vadmin/server.config.yaml"
    connection {
      host     = azurerm_public_ip.velociraptor-external.ip_address
      type     = "ssh"
      user     = "vadmin"
      private_key = tls_private_key.example_ssh.private_key_pem
      timeout  = "3m"
    }
  }
    depends_on = [azurerm_linux_virtual_machine.velociraptor_vm]
  }
