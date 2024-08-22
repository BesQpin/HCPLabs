terraform { 
  cloud { 
    
    organization = "BesQTF" 

    workspaces { 
      name = "HCPLabs" 
    } 
  } 
}

provider "azurerm" {
  features {}
  subscription_id      = var.subscription_id
  tenant_id            = var.tenant_id
}