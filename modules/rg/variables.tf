variable "env" {
    description = "The environment stage (dev/tst/uat/prd)"
    type = string
}

variable "rg_location" {
    description = "The resource group location"
    type = string
    default = "westus"
}

variable "rg_short_location" {
    description = "The resource group short location"
    type = string
    default = "wus"
}

variable "app_name" {
    description = "Name of application"
    type = string
}