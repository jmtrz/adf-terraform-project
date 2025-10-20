resource "azurerm_synapse_workspace" "this" {
  name                                 = var.resource_name
  resource_group_name                  = var.resource_group_name
  location                             = var.resource_group_location
  storage_data_lake_gen2_filesystem_id = var.storage_data_lake_gen2_filesystem_id
  sql_administrator_login              = var.sql_administrator_login
  sql_administrator_login_password     = var.sql_administrator_login_password
  managed_virtual_network_enabled      = var.managed_virtual_network_enabled
  tags                                 = var.tags
}