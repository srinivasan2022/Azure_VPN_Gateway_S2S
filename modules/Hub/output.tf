# output "rg_name" {
#   value = azurerm_resource_group.rg.name
# }

# output "rg_location" {
#   value = azurerm_resource_group.rg.location
# }

output "rg" {
  value = azurerm_resource_group.rg
}

output "vnet" {
  value = azurerm_virtual_network.vnet
}

output "subnet" {
  value = azurerm_subnet.GatewaySubnet
}

output "vpn_gateway_ip" {
  value = azurerm_public_ip.vpn_gateway_ip
}



