#################################################################
#   Variables
#################################################################

# Provider info

subscription_id = ""
client_id = ""
client_secret = ""
tenant_id = ""

# Generic info
location = "West US"

resource_group_name = "Velociraptor"

environment_name = "devops1"

# Network
address_space = ["10.100.0.0/16"]

dcsubnet_name = "sndc"

dcsubnet_prefix = "10.100.1.0/24"

wafsubnet_name = "snwf"
wafsubnet_prefix = "10.100.10.0/24"

rpsubnet_name = "snrp"

rpsubnet_prefix = "10.100.20.0/24"

user1_subnet_name = "user_finance_subnet"

user1_subnet_prefix = "10.100.30.0/24"

user2_subnet_name = "adversary_subnet"

user2_subnet_prefix = "10.100.40.0/24"

dbsubnet_name = "sndb"

dbsubnet_prefix = "10.100.50.0/24"

# Active Directory & Domain Controller 1

prefix = "devops1"

velociraptorprivate_ip_address = "10.100.1.4"

admin_username = "VAdmin"

admin_password = "Password123"

vmcount = "1"

# endpoint1
endpoint1_machine_name = "Win10-Lars"
endpoint1_username = "lars"

domainadmin_username = "'RTCAdmin@rtc.local'"

### 
### Set variable below for IP address prefix for white listing Azure NSG
### Uncomment; otherwise, all of the public Internet will be permitted
### https://ifconfig.me/ 
### curl https://ifconfig.me
#src_ip = "99.xx.28.yyy"
