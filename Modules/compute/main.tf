resource "azurerm_network_interface" "vm-nic" {
  name                = "${var.vmprofile.vm_name}-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  ip_configuration {
    name                          = "ipconfiguration1"
    subnet_id                     = var.vm_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  =  var.vmprofile.vm_name
  location              =  var.vmprofile.vm_location
  resource_group_name   = var.resource_group.name
  network_interface_ids = [azurerm_network_interface.vm-nic.id]
  vm_size               = var.vmprofile.vm_size


delete_os_disk_on_termination = true
delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.os_image.publisher
    offer     = var.os_image.offer
    sku       = var.os_image.sku
    version   = var.os_image.version
  }

  storage_os_disk {
    name              = "${var.vmprofile.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.os_profile.computer_name
    admin_username = var.os_profile.admin_username
    admin_password = var.os_profile.admin_password
  }

 os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
   source  = ""
    env     = ""
  }
}