variable "resource_group" {
  default     = {
        name  = ""
        location = ""
    }
}

variable "vpngw" {
   default={
       name = ""
       vpngwpipname = ""
       sku = ""
       local_gw_name = ""
       local_gw_address = ""
       local_gw_address_space = ["10.1.1.0/24"]
       conn_name = ""
       shared_key = ""
   } 
  }

  variable "vnet_subnet_id" {
 
  }

variable "ipsec_policy" {
   default={
       dh_group = ""
      ike_encryption = ""
      ike_integrity = ""
      ipsec_encryption = ""
      ipsec_integrity = ""
      pfs_group = ""
      sa_datasize = ""
      sa_lifetime = ""
   } 
  }