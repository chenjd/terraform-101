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
