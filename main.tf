terraform {
  cloud {
    organization = "adii238-org"   # 🔸 Replace with your Terraform Cloud org name
    workspaces {
      name = "azure-test"   # 🔸 Replace with your workspace name
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}
