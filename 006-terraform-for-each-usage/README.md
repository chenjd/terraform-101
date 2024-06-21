
## Terraform 101: for_each usage

![](https://cdn-images-1.medium.com/max/3840/1*mBSifseORUb7l5xsOvUNrg.jpeg)

The for_each argument in Terraform allows you to create multiple instances of a resource based on a **map** or a **set** of strings. It creates a direct association between a resource instance and an element in your set or map.

Here’s how you can use for_each to create multiple instances of a resource in different Azure regions:

    variable "regions" {
      description = "A set of regions"
      type        = set(string)
      default     = ["australiaeast", "australiasoutheast", "australiacentral"]
    }

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
>  To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101).

In the azurerm_resource_group block:

    resource "azurerm_resource_group" "this" {
      for_each = var.regions
      name     = "rg-${local.naming[each.key]}-example-001"
      location = each.key
    }

for_each is set to var.regions, which should be a map or set of regions. Terraform will create an instance of azurerm_resource_group for each element in var.regions. The each.key and each.value are used to access the key and value of each element in the map or set.

In the next block:

    resource "azurerm_storage_account" "this" {
      for_each                 = azurerm_resource_group.this
      name                     = "sta${local.naming[each.value.location]}example001"
      resource_group_name      = each.value.name
      location                 = each.value.location
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
    

for_each is set to azurerm_resource_group.this, which is a map of the resource groups created in the previous step. Terraform will create an instance of azurerm_storage_account for each resource group. The each.value **object** contains the attributes of each resource group, which are used to set the resource_group_name and location arguments for each storage account.

Run terraform plan followed by terraform apply to deploy the resources to Azure. The following screenshot demonstrates the successful creation of three storage account instances, each located in a different region.

![](https://cdn-images-1.medium.com/max/6760/1*vUQTotBvyt52IV-RohHv2w.png)

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101). I hope you find it useful!
