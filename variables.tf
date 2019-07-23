# variable "resourceprefix" {
#     default = "azsea"
#   }


########################################################################################    
## 
##   RESOURCE GROUP
##  
########################################################################################    
variable "sharedsvc-resource_group" {
  default     = {
        name  = "sharedsvc-rg"
        location = "SouthEast Asia"
    }
}


########################################################################################    
## 
##   HUB NETWORK
##  
######################################################################################## 
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


variable "hub-nsg" {
 default     = {
        name  = "nsg-hub"
       
    }
}


variable "tags" {
    default     = {
        source  = "citadel"
        env     = "training"
    }
}


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



  
variable "vmprofile" {
   default     = {
        vm_name  = "AD"
        vm_location = "SouthEast Asia"
        vm_size = "Standard_A4_v2"
    }
}

 
variable "os_image" {
   default     = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
    }
}

variable "os_profile" {
   default     = {
    computer_name  = "AstroDC"
    admin_username = "admin01"
    admin_password = "Passw0rd12345"
  }
  }
  