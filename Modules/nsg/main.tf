
resource "azurerm_resource_group" "nsgrg" {
    name = "${var.resourceprefix}-nsg-rg"
    location = "${var.loc}"
    tags = "${var.tags}"
}


resource "azurerm_network_security_group" "nsg" {
    name = "${var.resourceprefix}-nsg"
    resource_group_name = "${azurerm_resource_group.nsgrg.name}"
    location = "${azurerm_resource_group.nsgrg.location}"
    tags = "${azurerm_resource_group.nsgrg.tags}"
    
  }

resource "azurerm_network_security_rule" "AllowSSH" {
    name = "AllowSSH"
    resource_group_name = "${azurerm_resource_group.nsgrg.name}"
    network_security_group_name = "${azurerm_network_security_group.nsg.name}"
    priority = 1010
    access = "Allow"
    direction = "Inbound"
    protocol = "Tcp"
    destination_port_range = 22
    destination_address_prefix = "*"
    source_port_range = "*"
    source_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowHTTP" {
    name = "AllowHTTP"
    resource_group_name = "${azurerm_resource_group.nsgrg.name}"
    network_security_group_name = "${azurerm_network_security_group.nsg.name}"
    priority = 1020
    access = "Allow"
    direction = "Inbound"
    protocol = "Tcp"
    destination_port_range = 80
    destination_address_prefix = "*"
    source_port_range = "*"
    source_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowHTTPS" {
    name = "AllowHTTPS"
    resource_group_name = "${azurerm_resource_group.nsgrg.name}"
    network_security_group_name = "${azurerm_network_security_group.nsg.name}"
    priority = 1030
    access = "Allow"
    direction = "Inbound"
    protocol = "Tcp"
    destination_port_range = 443
    destination_address_prefix = "*"
    source_port_range = "*"
    source_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowSQLServer" {
    name = "AllowSQLServer"
    resource_group_name = "${azurerm_resource_group.nsgrg.name}"
     network_security_group_name = "${azurerm_network_security_group.nsg.name}"
    priority = 1040
    access = "Allow"
    direction = "Inbound"
    protocol = "Tcp"
    destination_port_range = 1433
    destination_address_prefix = "*"
    source_port_range = "*"
    source_address_prefix = "*"
}

resource "azurerm_network_security_rule" "AllowRDP" {
    name = "AllowRDP"
    resource_group_name = "${azurerm_resource_group.nsgrg.name}"
     network_security_group_name = "${azurerm_network_security_group.nsg.name}"
    priority = 1050
    access = "Allow"
    direction = "Inbound"
    protocol = "Tcp"
    destination_port_range = 3389
    destination_address_prefix = "*"
    source_port_range = "*"
    source_address_prefix = "*"
}

resource "azurerm_subnet_network_security_group_association" "nsg_web" {
  subnet_id                 = "${var.vnet_subnet_id}"
  network_security_group_id = "${azurerm_network_security_group.nsg.id}"
}