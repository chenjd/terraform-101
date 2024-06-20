resource "azurerm_resource_group" "this" {
    name     = "rg-aue-example-001"
    location = "australiaeast"
}

resource "azurerm_storage_account" "this" {
    name                     = "staaueexample001"
    resource_group_name      = azurerm_resource_group.this.name
    location                 = azurerm_resource_group.this.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}