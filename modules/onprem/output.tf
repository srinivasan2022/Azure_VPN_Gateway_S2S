output "rg" {
  value = azurerm_resource_group.rg
}

output "vnet" {
  value = azurerm_virtual_network.vnet
}

output "subnet" {
  value = azurerm_subnet.GatewaySubnet
}

output "GatewaySubnet" {
  value = azurerm_subnet.GatewaySubnet 
}

output "nic" {
  value = azurerm_network_interface.nic
}

output "vm_public_ip" {
  value = azurerm_public_ip.vm_public_ip
}

output "Testnic" {
  value = azurerm_network_interface.Testnic 
}

output "vpn_gateway_ip" {
  value = azurerm_public_ip.vpn_gateway_ip
}


