
variable "vmprofile" {
   default     = {
        vm_name  = "AD"
        vm_location = "SouthEast Asia"
        vm_size = "Standard_A2_v2"
    }
}

 
variable "os_image" {
   default     = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
    }
}

variable "os_profile" {
   default     = {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  }
  