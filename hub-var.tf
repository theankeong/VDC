variable "hub-resource_group" {
  default     = {
        name  = "vnet-rg"
        location = "vnet-rg"
    }
}

variable "hub-tags" {
   default     = {
        source  = ""
        env     = ""
    }
}

variable "hub-vnet" {
   default={name = "hub-vnet"
   ipaddress = ["10.1.0.0/16"]} 
  }

variable "hub-subnet_numbers" {
  default     = {
    "GatewaySubnet" = "10.1.0.0/24"
    "AzureFirewallSubnet" =  "10.1.1.0/24"
    "ext-dmz" =  "10.1.2.0/24"
    "int-dmz" =  "10.1.3.0/24"
    "shared-svc" =  "10.1.4.0/24"
  }
}


