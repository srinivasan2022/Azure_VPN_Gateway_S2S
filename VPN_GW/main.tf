terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.1.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

module "onprem" {
  source     = "../modules/onprem"
  rg_name    = "onprem-rg"
  location   = "East US"
  vnet_name  = "onprem-vnet"
  subnet_name = "onprem-subnet"
  vm_name = "onprem-vm"
}

module "hub" {
  source     = "../modules/Hub"
  rg_name    = "hub-rg"
  location   = "East US"
  vnet_name  = "hub-vnet"
  subnet_name = "hub-subnet"
}

module "spoke" {
  source     = "../modules/Spoke"
  rg_name    = "spoke-rg"
  location   = "East US"
  vnet_name  = "spoke-vnet"
  subnet_name = "spoke-subnet"
  vm_name = "spoke-vm"
}

module "onprem_vpn" {
  source     = "../modules/Gw"
  rg_name    = module.onprem.rg.name
  location   = module.onprem.rg.location
  gateway_subnet_id = module.onprem.GatewaySubnet.id
  public_ip_id = module.onprem.vpn_gateway_ip.id
  gw_address = module.onprem.vpn_gateway_ip.ip_address
  address_space = module.onprem.vnet.address_space[0]
  connection_name = "toHub"
  depends_on = [ module.onprem ]
}

# module "hub_vpn" {
#   source     = "../modules/Gw"
#   rg_name    = module.hub.rg.name
#   location   = module.hub.rg.location
#   gateway_subnet_id = module.hub.GatewaySubnet.id
#   public_ip_id = module.hub.vpn_gateway_ip.id
#   gw_address = module.hub.vpn_gateway_ip.ip_address
#   address_space = module.hub.vnet.address_space[0]
#   connection_name = "toOnprem"
#   depends_on = [ module.hub ]
# }

