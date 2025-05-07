output "rg" {
  value = azurerm_resource_group.rg
}

output "vnet" {
  value = azurerm_virtual_network.vnet
}

output "subnet" {
  value = azurerm_subnet.subnet
}

output "nic" {
  value = azurerm_network_interface.nic
}

