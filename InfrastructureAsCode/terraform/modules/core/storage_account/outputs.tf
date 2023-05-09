output "storage_account_name" {
  value = azurerm_storage_account.stgaccount.name
}

output "account_kind" {
  value = azurerm_storage_account.stgaccount.account_kind
}