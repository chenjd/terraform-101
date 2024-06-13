
## Terraform 101: Set remote backend

![](https://cdn-images-1.medium.com/max/3840/1*_6hSYe-P2QjjlMHTO6HQAw.jpeg)

In Terraform, the term “[**backend**](https://developer.hashicorp.com/terraform/language/settings/backends/configuration)” refers to the system used to store the Terraform state file. The state file is a JSON file that Terraform generates to track the resources it manages. By default, Terraform stores this file on your local filesystem. However, you can configure Terraform to store the state file remotely, which is what the backend configuration is for.

Storing Terraform state remotely, especially in a shared storage like Azure Storage, has several advantages:

 1. **Collaboration**: When working in a team, storing state remotely allows multiple people to work on the same Terraform configuration without overwriting each other’s changes.

 2. **Security**: State files can contain sensitive information. Storing state remotely allows you to take advantage of the security features of the remote storage, such as encryption at rest.

 3. **Versioning**: Some remote storage solutions provide versioning. This can be useful for auditing changes and rolling back to a previous state if necessary.

 4. **Locking**: Remote state allows Terraform to lock the state file when it’s being modified, preventing concurrent runs that could lead to conflicts or inconsistencies.

 5. **Continuity**: If your local machine encounters an issue, the state file stored remotely remains unaffected. This is particularly important in production environments.

Let’s set up Azure as the provider and configure Azure storage as the backend for storing Terraform state. Here is a breakdown of what each part does:

    terraform {
        backend "azurerm" {
            resource_group_name = ""
            storage_account_name = ""
            container_name = ""
            key = ""
            use_azuread_auth = true
        }
    }
    
    provider "azurerm" {
        features {}
    }

* terraform block: This block is used to configure certain Terraform behaviors, including the backend for storing state.

* backend "azurerm" block: This block configures Azure Storage as the backend for storing Terraform state. The resource_group_name, storage_account_name, container_name, and key fields should be filled in with the details of your Azure Storage account. The use_azuread_auth = true line indicates that Azure AD authentication is being used to access the storage account. So you should set up the Azure Storage in advance and have the required permission, like Storage Blob Data Contributor.

![](https://cdn-images-1.medium.com/max/3624/1*3Yepv7fSbRRXL499qCfinw.png)

* provider "azurerm" block: This block configures the Azure provider. The features {} block is required for the Azure provider but doesn't need to contain anything.

You can then set these values when you run the terraform init command with the -backend-config flag, as follows:

    terraform init -backend-config="resource_group_name=rg" -backend-config="storage_account_name=st" -backend-config="container_name=tfstate" -backend-config="key=dev.terraform.tfstate"

![](https://cdn-images-1.medium.com/max/3500/1*osoR5pDt8NKWtGGmUf-s_A.png)


Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101/tree/main/002-set-remote-backend). I hope you find it useful!
