resource "azurerm_resource_group" "nva-rg" {
    name = "${var.resourceprefix}-nva-rg"
    location = "${var.loc}"
    tags = "${var.tags}"
}

resource "azurerm_public_ip" "fw-pip" {
  name = "${var.resourceprefix}-fw-pip"
  location            = "${azurerm_resource_group.nva-rg.location}"
  resource_group_name = "${azurerm_resource_group.nva-rg.name}"
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "fw" {
  name = "${var.resourceprefix}-fw"
  location            = "${azurerm_resource_group.nva-rg.location}"
  resource_group_name = "${azurerm_resource_group.nva-rg.name}"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = "${var.vnet_subnet_id.hub_fw_id}"
    public_ip_address_id = "${azurerm_public_ip.fw-pip.id}"
  }
}