variable "ENV" {
    description = "The environment stage dev/tst/uat/prd"
    type = string
}

variable "APP_NAME" {
    description = "Name of the application"
    type = string
}

variable "RG_LOCATION" {
    description = "Location of resource group"
    type = string
}

variable "RG_LOCATION_SHORT" {
    description = "Short location of resource group"
    type = string
}

variable SKU_NAME {
    description = "App service plan sku"
    type = string
}

