
variable "resource_group" {
  default     = {
        name  = "aaa"
        location = "aaa"
    }
}

variable "nsg" {
   default={name = "hub"
   } 
  }


variable "tags" {
   default     = {
        source  = ""
        env     = ""
    }
}


variable "vnet_subnet_id" {
 
  }

