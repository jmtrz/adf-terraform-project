variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}   

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
}
variable "account_tier" {
  description = "The tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "The kind of the storage account"
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "The access tier of the storage account"
  type        = string
  default     = "Hot"
}

variable "containers" {
  type = map(object({
    access_type = string
  }))
  default = {}
  description = "Map of container names and their access types"
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

# Blob Storage
variable "blob_name" {
  description = "The name of the blob to create"
  type        = string
  default     = "default-blob"
}

variable "source_file_path" {
  description = "The local path of the file to upload as a blob"
  type        = string
}

# -------------
# Feature Flag
# -------------

variable "create_default_blob" {
  description = "Flag to create a default blob container named 'data'"
  type        = bool
  default     = false
}