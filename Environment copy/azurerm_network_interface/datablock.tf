data "azurerm_subnet" "snet" {
  for_each             = var.prod-nic
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network
  resource_group_name  = each.value.resource_group
}
data "azurerm_public_ip" "pip" {
  for_each = var.prod-nic
  name                = each.value.name
  resource_group_name = each.value.resource_group
}