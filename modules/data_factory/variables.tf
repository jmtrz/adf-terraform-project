variable "data_factory_name" {
  description = "The name of the Data Factory."
  type        = string 
}

variable "data_factory_location" {
  description = "The location where the Data Factory will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Data Factory will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Data Factory."
  type        = map(string)
}