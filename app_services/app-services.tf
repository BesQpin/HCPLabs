module "as1" {
  source  = "app.terraform.io/BesQTF/app_service-module/azurerm"
  version = "1.0.0"

  depends_on           = [module.rg1]

  asp_name            = "${local.res_name_prefix}asp1"
  sku_size            = var.sku_size
  location            = module.rg1.location
  resource_group_name = module.rg1.name
   
  #tags
  default_tags = "${local.default_tags}"
  custom_tags  = {
    Role = "AppService - nGinx"
  }

  app_services = {
    app1 = {
      name                = "${local.res_name_prefix}as1"
      location            = module.rg1.location
      # tag
      default_tags = local.default_tags 
      custom_tags  = {
        "Role" = "AppService - nGinx"
      }

      # azurerm_app_service
      https_only              = true
      create_app_service_plan = false
      client_cert_enabled     = false

      app_settings = {
        PORT                                = "4000"
        DOCKER_IMAGE                        = "DOCKER|BesQpin/nginx:stable-alpine3.19-otel"
        DOCKER_REGISTRY_SERVER_URL          = "hub.docker.com"
        WEBSITES_CONTAINER_START_TIME_LIMIT = 600
        DOCKER_ENABLE_CI                    = true
        #DOCKER_REGISTRY_SERVER_PASSWORD    = each.value.DOCKER_REGISTRY_SERVER_PASSWORD
        DOCKER_REGISTRY_SERVER_USERNAME     = "BesQpin"
      }

      site_config = {
        always_on             = var.always_on
        ftps_state            = "AllAllowed"
        http2_enabled         = true
        managed_pipeline_mode = "Integrated"
        minimum_tls_version   = "1.2"
        health_check_path     = "/"
      }
    }
    app2 = {
      name                = "${local.res_name_prefix}as2"
      location            = module.rg1.location
      # tag
      default_tags = local.default_tags 
      custom_tags  = {
        "Role" = "AppService - nGinx"
      }

      # azurerm_app_service
      https_only              = true
      create_app_service_plan = false
      client_cert_enabled     = false

      app_settings = {
        PORT                                = "4000"
        DOCKER_IMAGE                        = "DOCKER|BesQpin/nginx:stable-alpine3.19-otel"
        DOCKER_REGISTRY_SERVER_URL          = "hub.docker.com"
        WEBSITES_CONTAINER_START_TIME_LIMIT = 600
        DOCKER_ENABLE_CI                    = true
        #DOCKER_REGISTRY_SERVER_PASSWORD    = "key vault reference"
        DOCKER_REGISTRY_SERVER_USERNAME     = "BesQpin"
      }

      site_config = {
        always_on             = var.always_on
        ftps_state            = "AllAllowed"
        http2_enabled         = true
        managed_pipeline_mode = "Integrated"
        minimum_tls_version   = "1.2"
        health_check_path     = "/"
      }
    }
  }

  backup_primary_access_key     = module.str1.str_primary_access_key
  backup_primary_blob_endpoint  = module.str1.str_primary_blob_endpoint
  frequency_interval            = 1
  frequency_unit                = "Day"
  keep_at_least_one_backup      = true
  retention_period_in_days      = 30
  storage_account_url = "${module.str1.str_primary_blob_endpoint}${module.str1.strcon_blob_container}${data.azurerm_storage_account_blob_container_sas.containersas.sas}"  

  ip_restrictions = var.ip_restrictions

}