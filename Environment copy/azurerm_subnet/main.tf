resource "azurerm_subnet" "snet" {
  for_each             = var.prod-snet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group
  virtual_network_name = each.value.virtual_network
  address_prefixes     = each.value.address_prefixes
}