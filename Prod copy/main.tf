module "azurerm_resource_group" {
  source  = "../azurerm_resource_group"
  prod-rg = var.resource_groups
}

module "azurerm_virtual_network" {

  source    = "../azurerm_virtual_network"
  prod-vnet = var.v-net

  depends_on = [
  module.azurerm_resource_group]
}

module "azurerm_subnet" {

  source    = "../azurerm_subnet"
  prod-snet = var.s-net
  depends_on = [
    module.azurerm_virtual_network
  ]
}
module "azurerm_network_interface" {

  source   = "../azurerm_network_interface"
  prod-nic = var.vm-nic
  depends_on = [
    module.azurerm_public_ip,
    module.azurerm_subnet
  ]
}
module "azurerm_public_ip" {

  source = "../azurerm_public_ip"
  pip1   = var.nic-pip

}
module "azurerm_virtual_machine" {

  source = "../azurerm_virtual_machine"
  prod-vm =     var.lvm
depends_on = [
    module.azurerm_network_interface
    
  ]
}