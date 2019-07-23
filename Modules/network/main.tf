locals {
  subnet_list = keys(var.subnet_numbers)
}


resource "azurerm_virtual_network" "vnet" {  
    name = var.vnet.name
    resource_group_name = var.resource_group.name
    location = var.resource_group.location
    address_space = var.vnet.ipaddress
}


resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_numbers)
  name                 = local.subnet_list[count.index]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.resource_group.name
  address_prefix       = var.subnet_numbers[element(local.subnet_list, count.index)]
}