output "name" {
  description = "The name of the Synapse workspace"
  value       = azurerm_synapse_workspace.this.name
}

output "id" {
  description = "The ID of the Synapse workspace"
  value       = azurerm_synapse_workspace.this.id
}

# output "endpoint" {
#   description = "The endpoint of the Synapse workspace"
#   value       = azurerm_synapse_workspace.this.endpoint
# }

# output "sql_endpoint" {
#   description = "The SQL endpoint of the Synapse workspace"
#   value       = azurerm_synapse_workspace.this.sql_endpoint
# }

