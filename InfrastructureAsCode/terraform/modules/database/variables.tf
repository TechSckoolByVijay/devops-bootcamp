variable "resource_group_name" {
  type    = string
  default = "myproject-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "product" {
  type        = string
  description = "Name of the resource group"
}

variable "env" {
  type        = string
  description = "Name of the resource group"
}

variable "sql_server_admin_password" {
  type    = string
}

variable "subnet_id" {
  type    = string
  description = "allow the traffic from database subnet"
}
