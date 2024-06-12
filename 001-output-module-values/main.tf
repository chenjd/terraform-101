provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "this" {
    name     = "my-resource-group"
    location = "West Europe"
}

module "network" {
  source  = "./modules/network"  // path to the child module

  // Pass variables to the module
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  address_space       = "10.0.0.0/16"
}

output "vnet_id" {
  value = module.network.vnet_id
  description = "The ID of the virtual network"
}