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
    resource_group_name   = "kube"
    storage_account_name  = "terraformstatefilestg"
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
resource "random_pet" "aksrandom" {

}



module "resource_group" {
  source = "../modules/resource_group"

  name     = var.resource_group_name
  location = var.location
}

# module "storage_account" {
#   source = "../modules/storage_account"

#   name                = var.storage_account_name
#   resource_group_name = module.resource_group.name
# }

# Define other environment-specific resources or configuration here
