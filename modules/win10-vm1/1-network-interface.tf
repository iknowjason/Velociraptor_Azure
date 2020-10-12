resource "azurerm_public_ip" "win10-1-external" {
  #name               = "${var.prefix}-win10-1${1 + count.index}-ext"
  name                = "${var.prefix}-win10-1-ext"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "primary" {
  name                = "${var.prefix}-win10-1-int"
  location            = var.location
  resource_group_name = var.resource_group_name
  internal_dns_name_label = "${var.prefix}-win10-1"

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "static"
    private_ip_address = "10.100.30.11"
    public_ip_address_id = azurerm_public_ip.win10-1-external.id
  }
}
