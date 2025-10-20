resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier
  tags                     = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

# Create storage containers
resource "azurerm_storage_container" "this" {
  for_each              = var.containers
  name                  = each.key
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = each.value.access_type
}

resource "azurerm_storage_blob" "this" {
  count = var.create_default_blob ? 1 : 0
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.this.name
  storage_container_name = azurerm_storage_container.this["bronze"].name
  type                   = "Block"
  source                 = var.source_file_path
}