


resource "azurerm_storage_account" "stgaccount" {
  name = "${var.stg_account_name}"
  location = "${var.location}"
  account_replication_type = "GRS"
  resource_group_name      = "test"
  account_tier             = "Standard"
}