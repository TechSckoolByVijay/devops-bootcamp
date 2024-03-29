resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
  tags = {
    "Product" = var.product
    "Environment"   = var.env
    "CostCenterId"    = "10001"
    "Dept"           = "CS"
  }
}


resource "azurerm_storage_account" "stgaccount" {
  name = "${var.stg_account_name}"
  location = "${var.location}"
  account_replication_type = "GRS"
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "${var.product}${var.env}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

# https://www.davidc.net/sites/default/subnets/subnets.html  for subnet division.
resource "azurerm_subnet" "AKSSubnet" {
  name                 = "AKSSubnet"
  address_prefixes     = ["10.0.0.0/22"]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "VMSubnet" {
  name                 = "VMSubnet"
  address_prefixes     = ["10.0.4.0/24"]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "DBSubnet" {
  name                 = "DBSubnet"
  address_prefixes     = ["10.0.5.0/24"]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "Services" {
  name                 = "Services"
  address_prefixes     = ["10.0.6.0/24"]
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = azurerm_resource_group.rg.name
}


# resource "azurerm_user_assigned_identity" "identity" {
#   location            = azurerm_resource_group.rg.location
#   name                = "${var.product}${var.env}mi"
#   resource_group_name = azurerm_resource_group.rg.name
# }


# resource "azurerm_role_assignment" "identity_assignment" {
#   scope              = azurerm_resource_group.rg.id
#   role_definition_id = data.azurerm_role_definition.contributor.id
#   principal_id       = azurerm_user_assigned_identity.identity.principal_id
# }