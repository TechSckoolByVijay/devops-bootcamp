output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}


output "storage_account_name" {
  value = azurerm_storage_account.stgaccount.name
}

output "database_subnet_id" {
  value = azurerm_subnet.DBSubnet.id
}
