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

# Create a Virtual Network in the existing Resource Group
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet1"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "rg-terraform-demo1"
}

# Subnet 1
resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.10.0.0/24"]
}

# Subnet 2
resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.20.0.0/24"]
}
