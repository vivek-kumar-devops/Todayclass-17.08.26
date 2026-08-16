resource "azurerm_virtual_network" "vnet" {
  for_each            = var.prod-vnet
  name                = each.value.name
  resource_group_name = each.value.resource_group
  location            = each.value.location
  address_space       = each.value.address_space
}