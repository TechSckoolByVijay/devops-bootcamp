output "acrName" {
  value = azurerm_container_registry.acr.name
}

output "aksName" {
  value = azurerm_kubernetes_cluster.aks.name
}