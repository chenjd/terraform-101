locals {
  naming = {
    australiaeast      = "aue"
    australiasoutheast = "aus"
    australiacentral   = "auc"
  }
}

resource "azurerm_resource_group" "this" {
  for_each = var.regions
  name     = "rg-${local.naming[each.key]}-example-001"
  location = each.key
}

resource "azurerm_storage_account" "this" {
  for_each                 = azurerm_resource_group.this
  name                     = "sta${local.naming[each.value.location]}example001"
  resource_group_name      = each.value.name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}