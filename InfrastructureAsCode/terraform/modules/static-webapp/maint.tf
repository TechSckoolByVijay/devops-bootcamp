
resource "azurerm_static_site" "webapp" {
  name                = "${var.product}${var.env}-webapp"
  resource_group_name = var.resource_group_name
  location            = var.location
}
