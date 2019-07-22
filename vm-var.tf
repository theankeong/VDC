variable "vmresource_group" {
  default     = {
        name  = "aaa"
        location = "aaa"
    }
}
  

variable "vmprofile" {
   default     = {
        vm_name  = ""
        vm_location = ""
        vm_size = ""
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
  