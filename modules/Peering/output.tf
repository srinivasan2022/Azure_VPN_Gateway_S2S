output "hub_to_spoke" {
  value = azurerm_virtual_network_peering.hub_to_spoke
}

output "spoke_to_hub" {
  value = azurerm_virtual_network_peering.spoke_to_hub 
}