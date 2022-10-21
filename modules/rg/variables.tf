variable "env" {
    description = "The environment stage (dev/tst/uat/prd)"
    type = string
}

variable "rg_location" {
    description = "The resource group location"
    type = string
    default = "westus2"
}

variable "rg_location_short" {
    description = "The resource group short location"
    type = string
    default = "wus2"
}

variable "app_name" {
    description = "Name of application"
    type = string
}