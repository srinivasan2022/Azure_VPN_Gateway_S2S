# Hub to Spoke Peering (allowing gateway transit)
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = "hub-to-spoke"
  resource_group_name       = var.hub_rg_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.spoke_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic   = true
  allow_gateway_transit     =   true      # <- ENABLED
  use_remote_gateways       = false
}

# Spoke to Hub Peering (using remote gateway from hub)
resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "spoke-to-hub"
  resource_group_name       = var.spoke_rg_name
  virtual_network_name      = var.spoke_vnet_name
  remote_virtual_network_id = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = true        # <- ENABLED
}
