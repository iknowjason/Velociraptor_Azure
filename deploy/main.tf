# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  version = ">= 2.0"
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
}

##########################################################
## Create Resource group Network & subnets
##########################################################
module "network" {
  source              = "../modules/network"
  address_space       = var.address_space
  environment_name    = var.environment_name
  resource_group_name = var.resource_group_name
  location            = var.location
  src_ip              = var.src_ip
  dcsubnet_name       = var.dcsubnet_name
  dcsubnet_prefix     = var.dcsubnet_prefix
  wafsubnet_name      = var.wafsubnet_name
  wafsubnet_prefix    = var.wafsubnet_prefix
  rpsubnet_name       = var.rpsubnet_name
  rpsubnet_prefix     = var.rpsubnet_prefix
  user1_subnet_name   = var.user1_subnet_name
  user1_subnet_prefix = var.user1_subnet_prefix
  user2_subnet_name   = var.user2_subnet_name
  user2_subnet_prefix = var.user2_subnet_prefix
  dbsubnet_name       = var.dbsubnet_name
  dbsubnet_prefix     = var.dbsubnet_prefix
}

##########################################################
## Create Velociraptor system 
##########################################################
module "velociraptor" {
  source                        = "../modules/velociraptor"
  resource_group_name           = module.network.out_resource_group_name
  location                      = var.location
  prefix                        = var.prefix
  subnet_id                     = module.network.dc_subnet_subnet_id
  velociraptorprivate_ip_address         = var.velociraptorprivate_ip_address
}

### Create Windows 10 Pro VM-1
module "win10-vm-1" {
  source                    = "../modules/win10-vm1"
  resource_group_name       = module.network.out_resource_group_name
  location                  = var.location
  prefix                    = var.prefix
  endpoint1_machine_name    = var.endpoint1_machine_name
  endpoint1_username        = var.endpoint1_username
  subnet_id                 = module.network.user1_subnet_subnet_id
  active_directory_domain   = "${var.prefix}.local"
  active_directory_username = var.admin_username
  active_directory_password = var.admin_password
  admin_username            = var.admin_username
  admin_password            = var.admin_password
  vmcount                   = var.vmcount
}
