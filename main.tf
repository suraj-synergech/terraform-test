terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }

  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "tf-example-rg"
  location = "Central India"
}

module "storage_account" {
  source                = "./modules/storage_account"
  storage_account_name  = "exampletfsa${random_integer.rand.result}"
  resource_group_name   = azurerm_resource_group.example.name
  location              = "Central India"
  account_tier          = "Standard"
  account_replication_type = "LRS"
  min_tls_version       = "TLS1_2"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
}