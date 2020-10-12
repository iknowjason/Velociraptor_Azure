resource "null_resource" "velociraptor-config" {

### Wait about 60 seconds just to make sure that the velociraptor server has started
### We'll need to copy the config created from the server module, that is why we need to wait to make sure
### the config has been created
  provisioner "local-exec" {
    command = "sleep 60"
  }

  provisioner "local-exec" {
    command = "cp ../modules/velociraptor/files/config.yaml ${path.module}/files/Velociraptor.config.yaml"
  }

  depends_on = [azurerm_virtual_machine.win10-1]
}
