variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region in which the storage account should exist."
  type        = string
  default     = "Central India"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account (Standard/Premium)."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The type of replication to use (LRS, GRS, RAGRS, ZRS)."
  type        = string
  default     = "LRS"
}

variable "min_tls_version" {
  description = "The minimum TLS version to be permitted on requests to the storage account."
  type        = string
  default     = "TLS1_2"
}