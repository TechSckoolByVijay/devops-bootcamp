resource "azurerm_container_registry" "acr" {
  name = "${var.product}${var.env}acr"
  resource_group_name = var.resource_group_name
  location = var.location
  sku = "standard"
  admin_enabled       = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.product}-${var.env}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name
  node_resource_group = "${var.resource_group_name}-nrg"
  dns_prefix          = "${var.product}${var.env}aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
     type = "SystemAssigned"
  }
}