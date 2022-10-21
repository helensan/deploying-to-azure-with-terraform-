resource "azurerm_resource_group" "default" {
    name = "rg-${var.rg_location_short}-${var.env}-${var.app_name}"
    location = var.rg_location
}