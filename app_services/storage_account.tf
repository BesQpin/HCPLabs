module "str1" {
  source  = "app.terraform.io/BesQTF/storage_account-module/azurerm"
  version = "1.0.0"
  # insert required variables here


  storage_account_name  = "${local.res_name_prefix}str1"
  location              = var.region
  resource_group_name   = module.rg1.name

  account_tier              = "Standard"
  account_replication_type  = "LRS"

  storage_container_name    = "${local.res_name_prefix}str1bkp"
  container_access_type     = "private"

  # tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    Role = "AppService - Backup storage"
  }
}