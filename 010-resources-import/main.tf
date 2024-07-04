provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "this" {
  name                     = "sttfimportdemo"
  resource_group_name      = "rg-aue-dev"
  location                 = "australiaeast"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}