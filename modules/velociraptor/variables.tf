variable "resource_group_name" {
  description = "The name of the Resource Group where the Domain Controllers resources will be created"
}

variable "location" {
  description = "The Azure Region in which the Resource Group exists"
}

variable "prefix" {
  description = "The Prefix used for the Domain Controller's resources"
}

variable "subnet_id" {
  description = "The Subnet ID which the Domain Controller's NIC should be created in"
}

variable "velociraptorprivate_ip_address" {}

#variable "network_security_group_id" {}

/*variable "admin_username" {
  description = "The username associated with the local administrator account on the virtual machine"
}*/

/*variable "admin_password" {
  description = "The password associated with the local administrator account on the virtual machine"
}*/
