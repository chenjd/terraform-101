resource "azurerm_resource_group" "this" {
  name     = "rg-aue-example-${terraform.workspace}-001"
  location = "australiaeast"
}