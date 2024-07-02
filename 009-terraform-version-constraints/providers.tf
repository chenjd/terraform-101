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