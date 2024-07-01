# Use the primary provider to create a resource group in the primary subscription
resource "azurerm_resource_group" "primary_rg" {
  provider = azurerm.primary
  name     = "primary-resource-group"
  location = "australiaeast"
}

# Use the secondary provider to create a resource group in the secondary subscription
resource "azurerm_resource_group" "secondary_rg" {
  provider = azurerm.secondary
  name     = "secondary-resource-group"
  location = "australiasoutheast"
}