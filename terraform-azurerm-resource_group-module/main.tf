resource "azurerm_resource_group" "rg1" {
  name      = var.name
  location  = var.location
  tags      = merge(var.default_tags, var.custom_tags)
}