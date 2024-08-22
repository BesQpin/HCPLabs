#data "azurerm_resource_group" "shared_resource_group" {
#  name = "${var.region_code}${var.env}${var.project}rg1"
#}

data "azurerm_storage_account_blob_container_sas" "containersas"{  
  connection_string = module.str1.str_primary_connection_string
  container_name    = module.str1.strcon_blob_container
  https_only = true  
  start = local.current_time
  expiry = local.tomorrow
  permissions {  
    read   = true  
    add    = true  
    create = true  
    write  = true  
    delete = true  
    list   = true  
  }  
   
} 