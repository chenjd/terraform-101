
## Terraform 101: Dynamic Blocks

![To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101)](https://cdn-images-1.medium.com/max/3840/1*oSb1zAEFnpWAflY-Espxww.jpeg)

Dynamic blocks in Terraform allow you to dynamically construct **repeatable** nested blocks within a resource or data configuration. This feature is particularly useful **when you want to create multiple instances of a block based on the contents of a list or map**, like firewall rules or NSG rules, without having to hard-code each block instance.

Here’s an example of how to use a dynamic block within an Azure resource configuration. In this example, we’ll dynamically create **network security group (NSG) rules** within an Azure Network Security Group resource based on a list of rule definitions.

### Step 1: Define Variables for NSG Rules

First, define a variable to hold the details of each NSG rule you want to create. This could be a list of maps, where each map contains the properties of a rule.

    variable "nsg_rules" {
      description = "List of NSG rules"
      type = list(object({
        name                       = string
        priority                   = number
        direction                  = string
        access                     = string
        protocol                   = string
        source_port_range          = string
        destination_port_range     = string
        source_address_prefix      = string
        destination_address_prefix = string
      }))
      default = [
        {
          name                       = "allow-ssh"
          priority                   = 100
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "22"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        },
        {
          name                       = "allow-https"
          priority                   = 101
          direction                  = "Inbound"
          access                     = "Allow"
          protocol                   = "Tcp"
          source_port_range          = "*"
          destination_port_range     = "443"
          source_address_prefix      = "*"
          destination_address_prefix = "*"
        }
        # Add more rules as needed
      ]
    }

### Step 2: Create an Azure Network Security Group with Dynamic Security Rules

Next, use the dynamic block within the azurerm_network_security_group resource to dynamically create security rules based on the nsg_rules variable.

    resource "azurerm_network_security_group" "this" {
      name                = "example-nsg"
      location            = "australiaeast"
      resource_group_name = azurerm_resource_group.this.name
    
      dynamic "security_rule" {
        for_each = var.nsg_rules
        content {
          name                       = security_rule.value.name
          priority                   = security_rule.value.priority
          direction                  = security_rule.value.direction
          access                     = security_rule.value.access
          protocol                   = security_rule.value.protocol
          source_port_range          = security_rule.value.source_port_range
          destination_port_range     = security_rule.value.destination_port_range
          source_address_prefix      = security_rule.value.source_address_prefix
          destination_address_prefix = security_rule.value.destination_address_prefix
        }
      }
    }

In this configuration:

* The dynamic "security_rule" block iterates over each item in the var.nsg_rules list.

* The content block inside the dynamic block defines the schema of each NSG rule, using the security_rule.value to access the current item in the iteration.

* Each attribute of the security_rule is set based on the properties defined in the var.nsg_rules variable.

### Step 3: Apply the Configuration

After defining your variables and resource configuration, you can apply your Terraform configuration as usual with terraform apply. Terraform will dynamically create the NSG rules in the Azure Network Security Group based on the definitions in the nsg_rules variable.

![](https://cdn-images-1.medium.com/max/7080/1*WYPkca8YMHN4Hhduv70NDw.png)

This example demonstrates how dynamic blocks can simplify configurations and make them more flexible by allowing you to define repeatable sections based on the contents of variables.

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101). I hope you find it useful!
