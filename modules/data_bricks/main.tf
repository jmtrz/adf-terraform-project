resource "azurerm_databricks_workspace" "this" {
  name                = var.resource_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku                 = var.sku

  tags                = var.tags
}