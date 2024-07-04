
## Terraform 101: Resources Import

![To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101).](https://cdn-images-1.medium.com/max/3840/1*uEn1c_Xv7FYVOuqRyLqigg.jpeg)

The terraform import command is used to import existing infrastructure into your Terraform state. This allows Terraform to manage, update, and delete resources that were created outside of Terraform or by another Terraform configuration. The command is particularly useful for bringing resources under Terraform's management without having to recreate them.

Let’s go through an example of importing an Azure Storage Account into Terraform management.

![](https://cdn-images-1.medium.com/max/2984/1*EjsUV442jxX8Fp5rWZ-5jw.png)

### Step 1: Add the Resource to Your Terraform Configuration

First, define the resource in your Terraform configuration if it’s not already there.

    resource "azurerm_storage_account" "this" {
      name                     = "sttfimportdemo"
      resource_group_name      = "rg-aue-dev"
      location                 = "australiaeast"
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }

### Step 2: Find the Resource ID

For Azure resources, the resource ID is a unique identifier that Azure uses to manage the resource. You can find this ID using the Azure CLI, Azure PowerShell, or through the Azure Portal. 

![](https://cdn-images-1.medium.com/max/2736/1*XxmSuCG4W4D42WF3hSyYAA.png)

    "id": "/subscriptions/{subscriptionId}/resourceGroups/rg-aue-dev/providers/Microsoft.Storage/storageAccounts/sttfimportdemo",

### Step 3: Run the Import Command

With the resource defined in your Terraform configuration and the resource ID in hand, you can now import the resource. The command format for importing an Azure Storage Account is:

    terraform import azurerm_storage_account.this /subscriptions/{subscriptionId}/resourceGroups/rg-aue-dev/providers/Microsoft.Storage/storageAccounts/sttfimportdemo

![](https://cdn-images-1.medium.com/max/2820/1*UbE8zezfAA38tkVrJZXKPg.png)

### Step 4: Review and Apply Configuration

After importing, it’s important to review your Terraform configuration and ensure it accurately reflects the settings of the imported Azure Storage Account. You may need to adjust your configuration to match the actual properties of the resource.

Run terraform plan to see if there are any differences between your configuration and the real-world resource. If there are differences, Terraform will propose changes to align your configuration with the state of the imported resource. Apply any necessary changes with terraform apply.

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101). I hope you find it useful!




