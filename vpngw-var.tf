variable "vpngw" {
   default={
       name = "hub-vpn-gw"
       vpngwpipname = "hub-vpn-pip"
       sku = "VpnGw1"
       local_gw_name = "hub-vpn-localgw"
       local_gw_address = "50.50.50.50"
       local_gw_address_space = ["172.16.0.0/24"]
       conn_name = "vpn-local"
       shared_key = "aabbccddee"
   } 
  }


variable "ipsec_policy" {
   default={
      dh_group = "DHGroup14"
      ike_encryption = "AES256"
      ike_integrity = "SHA256"
      ipsec_encryption = "AES256"
      ipsec_integrity = "SHA256"
      pfs_group = "PFS1"
      sa_datasize = "102400000"
      sa_lifetime = "14400"
   } 
  }