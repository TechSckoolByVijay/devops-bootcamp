# We will define 
# 1. Terraform Settings Block
# 1. Required Version Terraform
# 2. Required Terraform Providers
# 3. Terraform Remote State Storage with Azure Storage Account (last step of this section)
# 2. Terraform Provider Block for AzureRM
# 3. Terraform Resource Block: Define a Random Pet Resource

# 1. Terraform Settings Block
terraform {
  # 1. Required Version Terraform
  required_version = ">= 0.13"
  # 2. Required Terraform Providers  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

# Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name   = "core-resources"
    storage_account_name  = "myorgterraformstg"
    container_name        = "tfstatefiles"
    key                   = "prod.terraform.tfstate"
  }  

}


# 2. Terraform Provider Block for AzureRM
provider "azurerm" {
  features {

  }
}

# 3. Terraform Resource Block: Define a Random Pet Resource
resource "random_string" "random" {
  length = 4
  lower  = true
  special = false
}



module "core_resources" {
  source = "../modules/core_resources"
  resource_group_name = var.resource_group_name
  location = var.location
  stg_account_name = "${var.product}${var.env}stg"
  product = var.product
  env =  var.env
}

module "azurerm_sql_database" {
  source = "../modules/database"
  depends_on = [ module.core_resources ]
  resource_group_name = var.resource_group_name
  location = var.location
  product = var.product
  env =  var.env
  sql_server_admin_password = var.sql_server_admin_password
  subnet_id = module.core_resources.database_subnet_id
}

module "static_app" {
  source = "../modules/static-webapp"
  depends_on = [ module.core_resources ]
  resource_group_name = var.resource_group_name
  location = "centralus"
  product = var.product
  env =  var.env
}

module "containerization" {
  source = "../modules/containerization"
  depends_on = [ module.core_resources ]
  resource_group_name = var.resource_group_name
  location = var.location
  product = var.product
  env =  var.env
}