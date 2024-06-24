
## Terraform 101: Output module values

![](https://cdn-images-1.medium.com/max/3840/1*abWDBlVoYeUhLQ5J1zBI4A.jpeg)

There are several reasons why you might want to output [**module**](https://developer.hashicorp.com/terraform/language/modules) values:

 1. **Inter-module dependencies**: If you have multiple modules and one depends on the value from another, you can use output values to expose that information. For example, if a networking module creates a virtual network and a compute module needs the ID of that virtual network to create instances, the networking module can output the virtual network ID and the compute module can reference it.

 2. **Inspection**: Output values can be used to print certain values in the command line after a terraform apply operation. This can be useful for debugging, or for getting information about the infrastructure that was created, such as virtual network IDs, public IP addresses, etc.

 3. **Consumption by external programs**: If you’re using Terraform in automation, the calling process can use output values to get information about what was created. This can be useful if the calling process needs to use this information to influence subsequent steps.

![](https://cdn-images-1.medium.com/max/2000/1*eiWHXUCDj5whZKLtNCyPsg.png)

Here’s how you can output that value in your root module:

First, define the child module and call it in your root module.

    module "network" {
      source  = "./modules/network"  // path to the child module
    
      // Pass variables to the module
      resource_group_name = azurerm_resource_group.this.name
      location            = azurerm_resource_group.this.location
      address_space       = "10.0.0.0/16"
    }

In your child module (e.g: located at ./modules/network), you might have something like this:

    output "vnet_id" {
      value = azurerm_virtual_network.vnet.id
    }

Then, in your root module, you can output the vnet_id like this:

    output "vnet_id" {
      value = module.network.vnet_id
      description = "The ID of the virtual network"
    }

In this example, vnet_id is the name of the output, module.network.vnet_id is the value of the output, and description is an optional field that describes what the output is.

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101/tree/main/001-output-module-values). I hope you find it useful!
