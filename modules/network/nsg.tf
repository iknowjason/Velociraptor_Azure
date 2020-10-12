resource "azurerm_network_security_group" "nsg1" {
  name                = "${var.resource_group_name}-nsg"
  location            = var.location
  resource_group_name = "${var.resource_group_name}-${var.environment_name}"

  security_rule {
    name                       = "allow-rdp"
    description                = "Allow Remote Desktop"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = var.src_ip
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-winrms"
    description                = "Windows Remote Managment (HTTPS-In)"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5986"
    source_address_prefix      = var.src_ip
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-winrm"
    description                = "Windows Remote Managment (HTTP-In)"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = var.src_ip
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-ssh"
    description                = "Allow SSH (SSH-In)"
    priority                   = 103
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.src_ip
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-HTTPS-8889"
    description                = "Permit HTTPS Port 8889 (HTTPS-In)"
    priority                   = 104
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8889"
    source_address_prefix      = var.src_ip
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "allow-agent"
    description                = "Permit Agent (8000-In)"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8000"
    source_address_prefix      = var.src_ip
    destination_address_prefix = "*"
  }

  depends_on = [azurerm_resource_group.network]
}
