
## Terraform 101: variable, local, output

![](https://cdn-images-1.medium.com/max/3840/1*KnjCOwpDuH9ykcOJi9tSPA.jpeg)

In Terraform, variable, local, and output are used for different purposes:

* variable: This is an **input** to your Terraform configuration. It allows you to define values that can be reused throughout your configuration and can be overridden when running Terraform commands. For example, you might define a variable for the region where you want to create resources.

* local: This is a way to define **a named expression** that allows you to simplify complex expressions and avoid repeating the same values. Locals are similar to variables, but they're defined within the module and can't be set from outside the module.

* output: This is a way to **display information** about what your configuration created. For example, you might output the IP address of a server that your configuration created.

Here’s an example that demonstrates the difference:

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

In this example:

* variable "region" is an input that sets the region where the resource group should be created. It has a default value of "australiaeast", but this can be overridden when running Terraform commands.

* locals { resource_name = "rg-${var.region}" } is a local value that generates the name of the resource group by concatenating "rg-" with the value of the region variable.

* output "instance_id" and output "local_value" are outputs that display the ID of the created resource group and the locally defined resource name, respectively. These values can be useful for debugging, for use in other modules, or for consumption by external programs.

![](https://cdn-images-1.medium.com/max/2000/1*RaMCix7EoU10e4JB503aVA.png)

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101). I hope you find it useful!
