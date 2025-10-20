module "random" {
    source       = "./modules/random"
    company_name = var.company_name
    environment  = var.environment
}

module "resource_group" {
    source   = "./modules/resource_group"
    name     = "rg-${var.company_name}-${var.environment}-${module.random.name}"
    location = var.resource_group_location
    tags     = var.resource_group_tags
}

# module "data_bricks" {
#     source                   = "./modules/data_bricks"
#     resource_name            = "dbks-${var.company_name}-${var.environment}-${module.random.name}"
#     resource_group_name      = module.resource_group.name
#     resource_group_location  = module.resource_group.location
#     sku                      = "trial"
#     tags                     = var.tags
# }

module "storage_account" {
    source                   = "./modules/storage_account"
    storage_account_name     = "st${var.company_name}${module.random.name}"
    resource_group_name      = module.resource_group.name
    resource_group_location  = module.resource_group.location
    account_tier             = var.account_tier
    account_replication_type = var.account_replication_type
    account_kind             = var.account_kind
    containers               = var.storage_containers
    create_default_blob      = true
    blob_name                = "blob${var.company_name}${module.random.name}"
    source_file_path         = "finance-sample.xlsx"
    tags                     = var.tags
}

# module "synapse_analytics" {
#     source                                  = "./modules/synapse_analytics"
#     resource_name                           = "syn-${var.company_name}-${var.environment}-${module.random.name}"
#     resource_group_name                     = module.resource_group.name
#     resource_group_location                 = module.resource_group.location
#     storage_data_lake_gen2_filesystem_id    = module.data_bricks.primary_filesystem_id
#     sql_administrator_login                 = var.synapse_sql_administrator_login
#     sql_administrator_login_password        = var.synapse_sql_administrator_login_password
#     managed_virtual_network_enabled         = true
#     tags                                    = var.tags    
# }

module "data_factory" {
    source                   = "./modules/data_factory"
    data_factory_name        = "df-${var.company_name}-${var.environment}-${module.random.name}"
    data_factory_location    = module.resource_group.location
    resource_group_name      = module.resource_group.name
    tags                     = var.tags
}

# module "sql_server" {
#     source                   = "./modules/sql_server"
#     sql_server_name          = "sql-${var.company_name}-${var.environment}-${module.random.name}"
#     sql_admin_username       = var.sql_admin_username
#     sql_admin_password       = var.sql_admin_password
#     resource_group_name      = module.resource_group.name
#     location                 = module.resource_group.location
#     db_minimum_tls_version   = var.db_minimum_tls_version
#     databases                = var.sql_databases
#     db_allow_azure_services  = var.db_allow_azure_services
#     db_allow_all_ips         = var.db_allow_all_ips
#     db_firewall_rules        = var.db_firewall_rules
#     tags                     = var.tags
# }