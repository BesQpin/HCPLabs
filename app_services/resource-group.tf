module "rg1" {
  source  = "app.terraform.io/BesQTF/resource_group-module/azurerm"
  version = "1.0.0"

  name      = "${local.res_name_prefix}rg1"
  location  = var.region

  # tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    Role = "AppService - Resource Group"
  }
}