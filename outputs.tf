# Resource Group outputs
output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.name
}