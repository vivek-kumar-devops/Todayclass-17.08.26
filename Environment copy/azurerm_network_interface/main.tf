
resource "azurerm_network_interface" "nic" {
  for_each            = var.prod-nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.snet[each.key].id
    private_ip_address_allocation = each.value.address_allocation
public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

