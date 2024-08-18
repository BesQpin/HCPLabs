output "str_primary_access_key" {
  value = azurerm_storage_account.str1.primary_access_key
}

output "str_primary_blob_endpoint" {
  value = azurerm_storage_account.str1.primary_blob_endpoint
}

output "strcon_blob_container" {
  value = azurerm_storage_container.strcon1.name
}

output "str_primary_connection_string" {
  value = azurerm_storage_account.str1.primary_connection_string
}