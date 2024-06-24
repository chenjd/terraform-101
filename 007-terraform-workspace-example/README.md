
## Terraform 101: Terraform Workspace Example

![To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101).](https://cdn-images-1.medium.com/max/3840/1*ZDo03QD0jk8rgjX9IvAVWQ.jpeg)

Terraform workspaces allow you to manage different states of your infrastructure parallelly. This feature is useful for managing multiple environments (e.g., development, staging, production) without needing to duplicate your Terraform configuration files.

Here’s a step-by-step guide on how to use Terraform workspaces:

### Step 1: Initialize Your Terraform Configuration

Before you can use workspaces, you need to initialize your Terraform configuration directory with terraform init.

    terraform init

### Step 2: Create a New Workspace

After initialization, Terraform starts with a **default workspace** named default.

![](https://cdn-images-1.medium.com/max/2196/1*-qwITD7fBm-0PyM3wRf74w.png)

To create a new workspace, use terraform workspace new followed by the name of the workspace.

    terraform workspace new dev

This command creates and switches to a workspace named dev.

![](https://cdn-images-1.medium.com/max/3016/1*6tcGoipZKnlLnVNrDphpyA.png)

### Step 3: Switch Between Workspaces

To switch between existing workspaces, use terraform workspace select followed by the name of the workspace.

    terraform workspace select default

![](https://cdn-images-1.medium.com/max/2688/1*A1gEpc5SI2YXA_CfTszi6Q.png)

### Step 4: Use Workspaces in Your Configuration

You can use the ${terraform.workspace} interpolation within your Terraform configuration to differentiate resources across workspaces. For example:

    resource "azurerm_resource_group" "this" {
      name     = "rg-aue-example-${terraform.workspace}-001"
      location = "australiaeast"
    }

In this example, resources will have the workspace name included in their names, allowing you to easily identify which workspace a resource belongs to.

### Step 5: Plan and Apply

When you run terraform plan or terraform apply, Terraform will use the configuration for the current workspace. Each workspace has its own state file, so changes in one workspace won't affect resources in another.

    terraform plan
    terraform apply

![](https://cdn-images-1.medium.com/max/2184/1*S3KKk2MZrjYsmhOL03pcCw.png)

### Step 6: List Workspaces

To see all your workspaces, use terraform workspace list.

    terraform workspace list

![](https://cdn-images-1.medium.com/max/2172/1*cltGFrNc7QAVGHuf_pPKTA.png)

### Step 7: Delete a Workspace

If you need to delete a workspace, first switch to a different workspace (**you cannot delete the current workspace**). Then use terraform workspace delete followed by the name of the workspace.

    terraform workspace select default
    terraform workspace delete dev

Remember, **deleting a workspace does not destroy the resources managed by that workspace**. If you want to destroy the resources, you should run terraform destroy while the workspace is selected, before deleting the workspace.

Workspaces are a powerful feature for managing multiple sets of infrastructure with the same codebase.

However, for complex scenarios or large teams, it might be more manageable to use separate configuration directories or modules, leveraging version control branches for each environment.

Thank you for reading! To explore the complete code for this case, visit the repository [here](https://github.com/chenjd/terraform-101). I hope you find it useful!
