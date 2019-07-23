
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
  