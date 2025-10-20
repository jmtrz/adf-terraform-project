variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "sql_admin_username" {
  description = "The administrator username for the SQL Server."
  type        = string
}

variable "sql_admin_password" {
  description = "The administrator password for the SQL Server."
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the SQL Server."
  type        = string
}

variable "location" {
  description = "The Azure region where the SQL Server will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the SQL Server."
  type        = map(string)
  default     = {}
}

variable "databases" {
  description = "A map of databases to create on the SQL Server."
  type = map(object({
    name           = string
    collation      = optional(string)
    sku_name      = string
    max_size_gb   = number
    read_scale     = optional(bool)
    zone_redundant = bool
    create_mode   = string
  }))
  default = {}
}

variable "create_local_firewall_rule" {
  description = "Flag to determine whether to create a firewall rule for local access"
  type        = bool
  default     = true
}

variable "db_allow_azure_services" {
  description = "Whether to allow Azure services to access the SQL server"
  type        = bool
  default     = true
}

variable "db_allow_all_ips" {
  description = "Whether to allow all IPs to access the SQL server"
  type        = bool
  default     = false
}

variable "db_firewall_rules" {
  description = "A map of firewall rules to create on the SQL server"
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
  default = {}
}

variable "db_minimum_tls_version" {
  description = "The minimum TLS version for the SQL server"
  type        = string
  default     = "1.2"
}