# Virtual Network Gateway (Azure side VPN Gateway)
resource "azurerm_virtual_network_gateway" "vpn_gateway" {
  name                = "vpn-gateway"
  location            = var.location
  resource_group_name = var.rg_name

  type     = "Vpn"
  vpn_type = "RouteBased"
  sku      = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id         = var.public_ip_id
    subnet_id                    = var.gateway_subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  enable_bgp     = false
  active_active  = false
}

# Local Network Gateway (your on-premises VPN device)
resource "azurerm_local_network_gateway" "local_gw" {
  name                = "local-onprem-gw"
  location            = var.location
  resource_group_name = var.rg_name

  gateway_address = var.gw_address          //"203.0.113.1"  # Replace with your on-prem VPN public IP
  address_space   = [var.address_space]      //["192.168.0.0/16"]  # Replace with your on-prem network range
  depends_on = [ azurerm_virtual_network_gateway.vpn_gateway ]
}

# Connection (between Azure VPN Gateway and Local Network Gateway)
resource "azurerm_virtual_network_gateway_connection" "vpn_connection" {
  name                            = var.connection_name
  location            = var.location
  resource_group_name = var.rg_name
  virtual_network_gateway_id      = azurerm_virtual_network_gateway.vpn_gateway.id
  local_network_gateway_id        = azurerm_local_network_gateway.local_gw.id
  type                            = "IPsec"
  connection_protocol             = "IKEv2"
  shared_key                      = "SuperSecret123!" # Replace with a secure key
  enable_bgp                      = false
  depends_on = [ azurerm_local_network_gateway.local_gw ]
}