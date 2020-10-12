#################################################################
#   Variables
#################################################################

# Provider info
variable subscription_id {}

variable client_id {}
variable client_secret {}
variable tenant_id {}

# Generic info
variable location {}

variable resource_group_name {}
variable environment_name {}

# Network
variable address_space {}

#variable dns_servers {}

variable wafsubnet_name {}
variable wafsubnet_prefix {}
variable rpsubnet_name {}
variable rpsubnet_prefix {}
#variable issubnet_name {}
variable user1_subnet_name {}
variable user2_subnet_name {}
#variable issubnet_prefix {}
variable user1_subnet_prefix {}
variable user2_subnet_prefix {}
variable dbsubnet_name {}
variable dbsubnet_prefix {}
variable dcsubnet_name {}
variable dcsubnet_prefix {}

# Velociraptor System 
variable prefix {}
variable velociraptorprivate_ip_address {}

# Win10 Endpoint
variable admin_username {}
variable admin_password {}

# IIS Servers
variable vmcount {}

variable "domainadmin_username" {}

# Endpoints
variable "endpoint1_machine_name" {}
variable "endpoint1_username" {}

### For Azure NSGs to whitelist your source prefix
### 
### Declare variable for IP address prefix for white listing Azure NSG
###
variable "src_ip" {
  type = string
  default = "*"
}

