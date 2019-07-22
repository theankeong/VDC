variable "resource_group" {
  default     = {
        name  = "aaa"
        location = "aaa"
    }
}

variable "tags" {
   default     = {
        source  = ""
        env     = ""
    }
}

variable "vnet" {
   default={name = "hub"
   ipaddress = ["10.0.0.0/16"]} 
  }

variable "subnet_numbers" {
  description = "Map from availability zone to the number that should be used for each availability zone's subnet"
  default     = {
    "ext_dmz" = "10.0.0.0/24"
    "web" =  "10.0.1.0/24"
    "app" =  "10.0.2.0/24"
  }
}