
## Terraform 101: Terraform Version Constraints

![To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101).](https://cdn-images-1.medium.com/max/3840/1*HhBteDN25YTUuCVi3JKxjg.jpeg)

In Terraform, you can restrict a provider’s version using the required_providers block within a terraform block in your configuration. There are several ways to specify version constraints, allowing you to precisely control which versions of a provider Terraform can use. Here are the main options:

 1. **Exact Version**: Specifies an exact version of a provider.

 2. **Version Range**: Allows any version within a specified range.

 3. **Minimum Version**: Specifies a minimum version, allowing any version greater than or equal to the specified version.

 4. **Maximum Version**: Specifies a maximum version, allowing any version less than the specified version.

 5. **Patch-level changes**: The ~> operator is used in Terraform to specify a version constraint that allows patch-level changes only.

Here’s an example that demonstrates all these options for the azurerm provider:

    terraform {
      required_providers {
        azurerm = {
          source  = "hashicorp/azurerm"
          # Exact Version
          version = "=3.110.0"
        }
        aws = {
          source  = "hashicorp/aws"
          # Version Range
          version = ">= 3.0.0, < 4.0.0"
        }
        google = {
          source  = "hashicorp/google"
          # Minimum Version
          version = ">= 3.5.0"
        }
        kubernetes = {
          source  = "hashicorp/kubernetes"
          # Maximum Version
          version = "< 2.0.0"
        }
        random = {
          source  = "hashicorp/random"
          # Patch-level changes within the 2.2 minor version
          version = "~> 2.2.0"
        }
      }
    }

In this example:

* For azurerm, only version 3.110.0 is allowed.

* For aws, any version 3.x.x is allowed.

* For google, version 3.5.0 and any newer version are allowed.

* For kubernetes, any version before 2.0.0 is allowed.

* For random, versions 2.2.0, 2.2.1, 2.2.2, etc., but not 2.3.0 or higher.

These constraints ensure that Terraform uses only provider versions that are compatible with your configuration, helping to avoid unexpected changes or incompatibilities.

Then run the terraform init command to install the providers that meet the version requirements, as you can see in the following screenshot.

![](https://cdn-images-1.medium.com/max/2868/1*gt5UljEAtUsEkT6EsC5eSw.png)

### **.terraform.lock.hcl**

At the same time, you will notice a file called ***.terraform.lock.hcl*** has been created.

![](https://cdn-images-1.medium.com/max/2064/1*P6t3sJJ5f9sVVA9pX71CdA.png)

The .terraform.lock.hcl file is a dependency lock file generated and used by Terraform to record the exact versions of providers and modules that were selected during the last run of terraform init. 

This ensures consistent operation and reproducibility across different environments and Terraform executions by locking the dependencies to specific versions. 

### terraform init -upgrade

The terraform init -upgrade command is used to reinitialize your Terraform working directory, with the added effect of upgrading all the modules and providers to the latest versions allowed within the constraints specified in your Terraform configuration files, even if you previously initialized with an older version.

This command is particularly useful for ensuring that your infrastructure is managed using the latest features, improvements, and bug fixes from your providers and modules, while still respecting the version constraints set to avoid unexpected changes.

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101). I hope you find it useful!




