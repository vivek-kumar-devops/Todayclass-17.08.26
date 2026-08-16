resource "azurerm_resource_group" "rg" {
  for_each = var.prod-rg
  name=each.value.name
  location = each.value.location
}