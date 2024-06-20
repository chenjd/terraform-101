
## Terraform 101: destroy resources methods

![](https://cdn-images-1.medium.com/max/4416/1*UiD0FKxV0Zxj4dkqfMsY1Q.png)

To destroy resources managed by Terraform, you can use the terraform destroy command. This command will destroy all resources that are defined in your Terraform configuration files and that have been created by Terraform.

![](https://cdn-images-1.medium.com/max/3108/1*4gNf-NwIn97oMt5NEt6kgg.png)
>  This command is a convenience alias for the terraform apply -destroy command.

Besides using the command to remove all resources, you can also employ alternative methods to either destroy specific resources or avoid using this command entirely. Let’s explore these options!

### **Targeted Destruction with terraform destroy**

If you want to destroy a specific resource instead of all resources, you can use the -target flag with the terraform destroy command. For example, to destroy the azurerm_storage_account resource from your Terraform file, you would use:

    terraform destroy -target=azurerm_storage_account.this

This command will only destroy the specified resource and any resources that depend on it.

![](https://cdn-images-1.medium.com/max/2408/1*mbz81aftKuP3QBxt98Vh5w.png)

### Remove the resource definition in the Terraform configuration.

If you remove a resource from your Terraform configuration and then run terraform apply, Terraform will delete the resource.

![](https://cdn-images-1.medium.com/max/3376/1*16a3BvX2DSSo8YT1RVgkPQ.png)

When you run terraform apply, Terraform compares your configuration with the current state of your infrastructure. If a resource exists in the state but not in the configuration, Terraform interprets this as you wanting to delete the resource, and it will plan to destroy it.

![](https://cdn-images-1.medium.com/max/2212/1*0DakgNQYS9Xk1wZFbZ7ImA.png)

After you confirm the plan, Terraform will delete the resource. This is one way to delete resources managed by Terraform, but be careful to ensure you are removing the correct resource from your configuration.

Here’s the example used here:

    terraform {
      required_providers {
        azurerm = ">= 3.0"
      }
    }
    
    provider "azurerm" {
      features {}
    }
    
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

    terraform destroy   
    terraform destroy -target=azurerm_storage_account.this   

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101). I hope you find it useful!
