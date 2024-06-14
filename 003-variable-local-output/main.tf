provider "azurerm" {
    features{}
}

variable "region" {
  description = "The region where resources should be created"
  type        = string
  default     = "australiaeast"
}

locals {
  resource_name = "rg-${var.region}"
}

resource "azurerm_resource_group" "example" {
    name     = local.resource_name
    location = var.region
}

output "instance_id" {
  description = "The ID of the created instance"
  value       = azurerm_resource_group.example.id
}

output "local_value" {
    value = local.resource_name
}