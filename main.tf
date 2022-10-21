terraform {
    backend "azurerm" {}
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.27.0"
        }
    }
}

provider "azurerm" {
    features {
        resource_group {
            prevent_deletion_if_contains_resources = false
        }
    }
}

module "rg" {
    source = "./modules/rg"
    env = var.ENV
    app_name = var.APP_NAME
    rg_location = var.RG_LOCATION
    rg_short_location = var.RG_LOCATION_SHORT
}

resource "azurerm_service_plan" "asp" {
    name = "asp-${var.RG_LOCATION_SHORT}-${var.ENV}-${var.APP_NAME}"
    location = module.rg.location
    resource_group_name = module.rg.name
    os_type = "Linux"
    sku_name = "F1"
}

resource "azurerm_application_insights" "ai" {
    name = "ai-${var.RG_LOCATION_SHORT}-${var.ENV}-${var.APP_NAME}"
    location = module.rg.location
    resource_group_name = module.rg.name
    application_type = "web"
}

resource "azurerm_linux_web_app" "app" {
    name = "app-${var.RG_LOCATION_SHORT}-${var.ENV}-${var.APP_NAME}"
    location = module.rg.location
    resource_group_name = module.rg.name
    app_service_plan_id = azurerm_service_plan.asp.id
    identity {
        type = "SystemAssigned"
    }
    site_config {}
    app_settings = {
        APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.ai.instrumentation_key
        APPLICATIONINSIGHTSAGENT_EXTENSION_ENABLED = true
    }
}