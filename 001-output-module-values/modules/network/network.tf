variable "resource_group_name" {}
variable "location" {}
variable "address_space" {}

resource "azurerm_virtual_network" "vnet" {
  name                = "myVNet"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.address_space]
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}