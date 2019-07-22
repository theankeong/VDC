variable "resourceprefix" {
   
  }

variable "loc" {
    description = "Default Azure Region"
   
}

variable "tags" {
   default     = {
        source  = ""
        env     = ""
    }
}

variable "hub_ipaddress" {
  default={
   hub =["10.0.0.0/16"]
   gw = "10.0.0.0/24"
   sharedsvc = "10.0.1.0/24"
   ext_dmz = "10.0.0.2/24"
   nva = "10.0.0.3/24"
}
}

variable "spoke_ipaddress" {
  default={
   spoke =["10.0.0.0/16"]
   web = "10.0.0.0/24"
   app = "10.0.1.0/24"
   data = "10.0.2.0/24"
   }
}