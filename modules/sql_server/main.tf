resource "azurerm_mssql_server" this {
    name                         = var.sql_server_name
    resource_group_name          = var.resource_group_name
    location                     = var.location
    version                      = "12.0"
    administrator_login          = var.sql_admin_username
    administrator_login_password = var.sql_admin_password
    minimum_tls_version          = var.db_minimum_tls_version
    tags                         = var.tags
}

resource "azurerm_mssql_database" "databases" {
    for_each        = var.databases
    name            = each.value.name
    server_id       = azurerm_mssql_server.this.id
    collation       = each.value.collation
    sku_name        = each.value.sku_name
    max_size_gb     = each.value.max_size_gb
    read_scale      = each.value.read_scale
    zone_redundant  = each.value.zone_redundant
    create_mode     = each.value.create_mode
    tags            = var.tags
}

# Azure SQL Server Firewall Rule to allow Azure services
resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  count            = var.db_allow_azure_services ? 1 : 0
  name             = "FirewallRule-AllowAzureServices"
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "allow_all_ips" {
  count            = var.db_allow_all_ips ? 1 : 0
  name             = "FirewallRule-AllowAllIPs"
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

# # Azure SQL Server Firewall Rules for additional IP addresses
resource "azurerm_mssql_firewall_rule" "additional_rules" {
  for_each         = var.db_firewall_rules
  name             = each.key
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}
