resource "azurerm_public_ip" "vpngwpip" {
  name                = var.vpngw.vpngwpipname
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  allocation_method = "Dynamic"
}

resource "azurerm_local_network_gateway" "onpremise" {
  name                = var.vpngw.local_gw_name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.location
  gateway_address     = var.vpngw.local_gw_address
  address_space       = var.vpngw.local_gw_address_space
}


resource "azurerm_virtual_network_gateway" "vpngw" {
    name                = var.vpngw.name
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name
    type     = "Vpn"
    vpn_type = "RouteBased"

    active_active = false
    enable_bgp    = false
    sku           = var.vpngw.sku

    ip_configuration {
        name                          = "vnetGatewayConfig"
        public_ip_address_id          = azurerm_public_ip.vpngwpip.id
        private_ip_address_allocation = "Dynamic"
        subnet_id                     = var.vnet_subnet_id
    }
}

resource "azurerm_virtual_network_gateway_connection" "vpn_gw_conn" {
  name                = var.vpngw.conn_name
  location            = var.resource_group.location
    resource_group_name = var.resource_group.name

  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vpngw.id
  local_network_gateway_id   = azurerm_local_network_gateway.onpremise.id

  shared_key = var.vpngw.shared_key

  ipsec_policy{
      dh_group = var.ipsec_policy.dh_group
      ike_encryption = var.ipsec_policy.ike_encryption
      ike_integrity = var.ipsec_policy.ike_integrity
      ipsec_encryption = var.ipsec_policy.ipsec_encryption
      ipsec_integrity = var.ipsec_policy.ipsec_integrity
      pfs_group = var.ipsec_policy.pfs_group
      sa_datasize = var.ipsec_policy.sa_datasize
      sa_lifetime = var.ipsec_policy.sa_lifetime
  }
}