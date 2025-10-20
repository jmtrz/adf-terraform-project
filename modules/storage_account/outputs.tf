output "storage_account_id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.this.id
}

output "storage_account_primary_blob_endpoint" {
  description = "The primary Blob service endpoint for the storage account"
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.this.name
}

output "tags" {
  description = "A map of tags assigned to the resource"
  value       = var.tags
}