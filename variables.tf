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

variable APP_SERVICE_PLAN_TIER {
    description = "App service plan tier"
    type = string
}

variable APP_SERVICE_PLAN_SIZE {
    description = "App service plan size"
    type = string
}

