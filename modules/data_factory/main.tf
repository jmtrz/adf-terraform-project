resource "azurerm_data_factory" this {
  name                = var.data_factory_name
  location            = var.data_factory_location
  resource_group_name = var.resource_group_name
  tags                = var.tags  
}