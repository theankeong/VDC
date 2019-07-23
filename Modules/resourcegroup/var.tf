

variable "resource_group" {

  default     = {

        name  = "vnet-rg"

        location = "SouthEast Asia"

    }

}

variable "tags" {

   default     = {

        source  = ""

        env     = ""

    }

}