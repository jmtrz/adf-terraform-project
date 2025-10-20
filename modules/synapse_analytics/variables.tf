variable "resource_name" {
  description = "The name of the Synapse Analytics workspace"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "The location of the resource group"
  type        = string
  default     = "southeastasia"
}

variable "storage_data_lake_gen2_filesystem_id" {
  description = "The ID of the Data Lake Gen2 filesystem associated with the Synapse workspace"
  type        = string
}

variable "sql_administrator_login" {
  description = "The SQL administrator login for the Synapse workspace"
  type        = string
}

variable sql_administrator_login_password {
  description = "The SQL administrator login password for the Synapse workspace"
  type        = string
  sensitive   = true
}

variable "managed_virtual_network_enabled" {
  description = "Enable or disable the managed virtual network for the Synapse workspace"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}