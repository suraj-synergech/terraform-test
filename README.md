# terraform-test

This project demonstrates a Terraform module to create an Azure Storage Account in the Central India region.

## Module Structure
```
modules/
└─ storage_account/
   ├─ main.tf
   ├─ variables.tf
   └─ outputs.tf
```

## Usage
```hcl
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "tf-example-rg"
  location = "Central India"
}

resource "random_integer" "rand" {
  min = 10000
  max = 99999
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
```

## Inputs
| Name                   | Description                                               | Type   | Default         |
|------------------------|-----------------------------------------------------------|--------|-----------------|
| storage_account_name   | The name of the storage account.                          | string | n/a             |
| resource_group_name    | The name of the resource group.                           | string | n/a             |
| location               | The Azure region in which the storage account should exist| string | Central India   |
| account_tier           | Tier to use for storage account (Standard/Premium)        | string | Standard        |
| account_replication_type | Replication type (LRS, GRS, RAGRS, ZRS)                | string | LRS             |
| min_tls_version        | Minimum TLS version permitted                             | string | TLS1_2          |

## Outputs
| Name                  | Description              |
|-----------------------|--------------------------|
| storage_account_id    | The ID of the storage account |
| storage_account_name  | The storage account name |

---

## Instructions
1. Initialize Terraform: `terraform init`
2. Plan the changes: `terraform plan`
3. Apply: `terraform apply`

---

Created by RJ
