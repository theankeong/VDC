resource "azurerm_virtual_network_peering" "hubspoke" {
  name                      = "hubspoke"
  resource_group_name       = "${azurerm_resource_group.vnetrg.name}"
  virtual_network_name      = "${azurerm_virtual_network.hub-vnet.name}"
  remote_virtual_network_id = "${azurerm_virtual_network.spoke-vnet.id}"
}

resource "azurerm_virtual_network_peering" "spokehub" {
  name                      = "spokehub"
  resource_group_name       = "${azurerm_resource_group.vnetrg.name}"
  virtual_network_name      = "${azurerm_virtual_network.spoke-vnet.name}"
  remote_virtual_network_id = "${azurerm_virtual_network.hub-vnet.id}"
}