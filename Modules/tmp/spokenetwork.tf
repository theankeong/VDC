resource "azurerm_virtual_network" "spoke-vnet"{  
  name = "${var.resourceprefix}-spoke-vnet"
    resource_group_name = "${azurerm_resource_group.vnetrg.name}"
    location = "${azurerm_resource_group.vnetrg.location}"
    address_space = "${var.spoke_ipaddress.spoke}"
     }

resource "azurerm_subnet" "web-subnet"{
    name = "web"
    resource_group_name = "${azurerm_resource_group.vnetrg.name}"
    virtual_network_name = "${azurerm_virtual_network.spoke-vnet.name}"
    address_prefix = "${var.spoke_ipaddress.web}"
}

resource "azurerm_subnet" "app-subnet"{
    name = "app"
    resource_group_name = "${azurerm_resource_group.vnetrg.name}"
    virtual_network_name = "${azurerm_virtual_network.spoke-vnet.name}"
    address_prefix = "${var.spoke_ipaddress.app}"
}

resource "azurerm_subnet" "data-subnet"{
    name = "data"
    resource_group_name = "${azurerm_resource_group.vnetrg.name}"
    virtual_network_name = "${azurerm_virtual_network.spoke-vnet.name}"
    address_prefix = "${var.spoke_ipaddress.data}"
}