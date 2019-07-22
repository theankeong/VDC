resource "azurerm_resource_group" "vnetrg" {
    name = "core-rg"
    location = "${var.loc}"
    tags = "${var.tags}"
}

resource "azurerm_virtual_network" "hub-vnet"{  
  name = "${var.resourceprefix}-hub-vnet"
    resource_group_name = "${azurerm_resource_group.vnetrg.name}"
    location = "${azurerm_resource_group.vnetrg.location}"
    address_space = "${var.hub_ipaddress.hub}"
      }

resource "azurerm_subnet" "gw-subnet"{
    name = "GatewaySubnet"
    resource_group_name = "${azurerm_resource_group.vnetrg.name}"
    virtual_network_name = "${azurerm_virtual_network.hub-vnet.name}"
    address_prefix = "${var.hub_ipaddress.gw}"
}

resource "azurerm_subnet" "fw-subnet"{
    name = "AzureFirewallSubnet"
    resource_group_name = "${azurerm_resource_group.vnetrg.name}"
    virtual_network_name = "${azurerm_virtual_network.hub-vnet.name}"
    address_prefix = "${var.hub_ipaddress.fw}"
}

resource "azurerm_subnet" "ext_dmz-subnet" {
    name  = "ext_dmz"
    resource_group_name = "${azurerm_resource_group.vnetrg.name}"
    virtual_network_name = "${azurerm_virtual_network.hub-vnet.name}"
    address_prefix = "${var.hub_ipaddress.ext_dmz}"
}

resource "azurerm_subnet" "sharedsvc-subnet" {
    name           = "sharedsvc"
    resource_group_name = "${azurerm_resource_group.vnetrg.name}"
    virtual_network_name = "${azurerm_virtual_network.hub-vnet.name}"
    address_prefix = "${var.hub_ipaddress.sharedsvc}"
}
