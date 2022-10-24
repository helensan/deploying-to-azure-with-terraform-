terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.27.0"
        }
    }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
    name = "rg-${var.RG_LOCATION_SHORT}-${var.ENV}-${var.APP_NAME}"
    location = var.rg_location
}

resource "azurerm_service_plan" "asp" {
    name = "asp-${var.RG_LOCATION_SHORT}-${var.ENV}-${var.APP_NAME}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    os_type = "Linux"
    sku_name = "F1"
}

resource "azurerm_application_insights" "ai" {
    name = "ai-${var.RG_LOCATION_SHORT}-${var.ENV}-${var.APP_NAME}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    application_type = "web"
}

resource "azurerm_linux_web_app" "app" {
    name = "app-${var.RG_LOCATION_SHORT}-${var.ENV}-${var.APP_NAME}"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    service_plan_id = azurerm_service_plan.asp.id
    identity {
        type = "SystemAssigned"
    }
    site_config {}
    app_settings = {
        APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.ai.instrumentation_key
        APPLICATIONINSIGHTSAGENT_EXTENSION_ENABLED = true
    }
}