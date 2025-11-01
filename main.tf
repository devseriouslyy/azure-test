terraform {
  cloud {
    organization = "adii238-org"     # 🔸 Replace with your Terraform Cloud org name
    workspaces {
      name = "azure-test"     # 🔸 Replace with your workspace name
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

# ──────────────────────────────────────────────
#  Create a Resource Group
# ──────────────────────────────────────────────

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-demo1"       # 🔸 Change this to your desired RG name
  location = "East US"                 # 🔸 Or use your preferred Azure region
  tags = {
    environment = "dev"
    created_by  = "Terraform Cloud"
  }
}

# Optional output
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
