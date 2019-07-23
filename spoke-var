variable "spoke-resource_group" {
  default     = {
        name  = "vnet-rg"
        location = "vnet-rg"
    }
}

variable "spoke-tags" {
   default     = {
        source  = ""
        env     = ""
    }
}

variable "spoke-vnet" {
   default={name = "spoke-vnet"
   ipaddress = ["10.2.0.0/16"]} 
  }

variable "spoke-subnet_numbers" {
  default     = {
    "web" = "10.2.0.0/24"
    "app" =  "10.2.1.0/24"
    "data" =  "10.2.2.0/24"
  }
}