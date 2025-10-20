variable "company_name" {
  description = "The name of the company"
  type        = string
  default     = "personal"
}

variable "environment" {
  description = "The deployment environment"
  type        = string
  default     = "sandbox"
}

variable "resource_group_location" {
  description = "The Azure location where the resource group should be created"
  type        = string
  validation {
    condition = contains([
      "eastus", "eastus2", "westus", "westus2", "westus3", "centralus", "northcentralus", "southcentralus",
      "westcentralus", "canadacentral", "canadaeast", "brazilsouth", "northeurope", "westeurope",
      "francecentral", "germanywestcentral", "norwayeast", "switzerlandnorth", "uksouth", "ukwest",
      "eastasia", "southeastasia", "australiaeast", "australiasoutheast", "centralindia", "southindia",
      "westindia", "japaneast", "japanwest", "koreacentral", "koreasouth"
    ], var.resource_group_location)
    error_message = "Location must be a valid Azure region."
  }
}

variable "resource_group_tags" {
  description = "A mapping of tags to assign to the resource group"
  type        = map(string)
  default     = {}
}

variable "tags" {
    description = "A map of tags to assign to the resource"
    type        = map(string)
    default     = {
        "purpose" = "demo"
    }
}

## Storage Account Variables
variable "account_tier" {
  description = "The access tier of the storage account"
  type        = string
  default     = "Standard"
}

variable "account_kind" {
  description = "The kind of the storage account"
  type        = string
  default     = "StorageV2"
}

variable "account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "The access tier of the storage account"
  type        = string
  default     = "Hot"
}

variable "storage_containers" {
  type = map(object({
    access_type = string
  }))
  default = {}
  description = "Map of container names and their access types"
}

variable "synapse_sql_administrator_login" {
  description = "The SQL administrator login for the Synapse workspace"
  type        = string
}

variable "synapse_sql_administrator_login_password" {
  description = "The SQL administrator login password for the Synapse workspace"
  type        = string
  sensitive   = true
}

# Database Variables
variable "sql_admin_username" {
  description = "The administrator username for the SQL Server."
  type        = string
  default     = "sqladminuser"
}

variable "sql_admin_password" {
  description = "The administrator password for the SQL Server."
  type        = string
  sensitive   = true
}

variable "db_minimum_tls_version" {
  description = "The minimum TLS version for the SQL Server."
  type        = string
  default     = "1.2"
}

variable "db_firewall_rules" {
  description = "A map of firewall rules to create on the SQL Server."
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
  default = {}
}

variable "db_allow_azure_services" {
  description = "Whether to allow Azure services to access the SQL Server."
  type        = bool
  default     = true
}

variable "db_allow_all_ips" {
  description = "Whether to allow all IPs to access the SQL Server."
  type        = bool
  default     = false
}

variable "sql_databases" {
  description = "A map of databases to create on the SQL Server."
  type = map(object({
    name           = string
    sku_name      = string
    max_size_gb   = number
    zone_redundant = bool
    create_mode   = string
  }))
  default = {}
}

variable "db_sku_name" {
  description = "The SKU name for all SQL databases (e.g., Basic, S0, S1, S2, S3, P1, P2, P4)"
  type        = string
  default     = "Basic"
  validation {
    condition = contains([
      "Basic",
      "S0", "S1", "S2", "S3", "S4", "S6", "S7", "S9", "S12",
      "P1", "P2", "P4", "P6", "P11", "P15",
      "GP_Gen5_2", "GP_Gen5_4", "GP_Gen5_6", "GP_Gen5_8", "GP_Gen5_10", "GP_Gen5_12", "GP_Gen5_14", "GP_Gen5_16", "GP_Gen5_18", "GP_Gen5_20", "GP_Gen5_24", "GP_Gen5_32", "GP_Gen5_40", "GP_Gen5_80",
      "BC_Gen5_2", "BC_Gen5_4", "BC_Gen5_6", "BC_Gen5_8", "BC_Gen5_10", "BC_Gen5_12", "BC_Gen5_14", "BC_Gen5_16", "BC_Gen5_18", "BC_Gen5_20", "BC_Gen5_24", "BC_Gen5_32", "BC_Gen5_40", "BC_Gen5_80"
    ], var.db_sku_name)
    error_message = "Invalid db_sku_name. Must be one of: Basic, S0-S12, P1-P15, or General Purpose/Business Critical Gen5 SKUs. Common values: Basic, S0, S1, S2, S3, P1, P2, P4."
  }
}

variable "db_collation" {
  description = "SQL collation for all databases"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "db_max_size_gb" {
  description = "The maximum size in GB for all SQL databases"
  type        = number
  default     = 2
}

variable "db_zone_redundant" {
  description = "Whether the database is zone redundant"
  type        = bool
  default     = false
}