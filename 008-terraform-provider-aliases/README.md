
## Terraform 101: Terraform Provider Aliases

![To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101).](https://cdn-images-1.medium.com/max/3840/1*6R1ulnqyS8XPibgOiiHUfA.jpeg)

To create multiple instances of a provider in Terraform, especially for Azure, you can define multiple provider blocks with different **aliases** and configurations. This approach is useful when you need to manage resources ***across different Azure subscriptions, regions, or both***.

Suppose you have Azure subscriptions for development and production environments. You can define providers with aliases for each environment and then use these aliases to create resources in the respective environments.

Here’s an example of how to configure multiple Azure provider instances with aliases:

    # Define the provider for the primary Azure subscription
    provider "azurerm" {
      features {}
      # Primary subscription details
      subscription_id = "primary-subscription-id"
      alias           = "primary"
    }
    
    # Define the provider for the secondary Azure subscription
    provider "azurerm" {
      features {}
      # Secondary subscription details
      subscription_id = "secondary-subscription-id"
      alias           = "secondary"
    }
    
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

In this example, two azurerm provider blocks are defined, each with a different alias (primary and secondary). Each provider block specifies a different subscription_id. When defining resources, you can specify which provider to use by setting the provider attribute to either azurerm.primary or azurerm.secondary. 

![](https://cdn-images-1.medium.com/max/3592/1*HZJSG09r7MdQkK68KUC5bg.png)

This allows you to manage resources across different subscriptions within the same Terraform configuration.

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101). I hope you find it useful!


