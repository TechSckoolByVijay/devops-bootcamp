# Create an Azure SQL Server

resource "azurerm_sql_server" "sql_server" {
  name                         = "${var.product}-${var.env}-sqlserver"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "${var.product}-${var.env}-user"
  administrator_login_password = var.sql_server_admin_password
}

# Create a firewall rule to allow traffic from all Azure services
resource "azurerm_sql_firewall_rule" "allow-all" {
  name                = "AllowAllWindowsAzureIps"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_virtual_network_rule" "allow-database-subnet" {
  name                = "allow-database-subnet"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_sql_server.sql_server.name
  subnet_id           = var.subnet_id
}


# Create an Azure SQL Database

resource "azurerm_sql_database" "db" {
  name                     = "${var.product}-${var.env}-db"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  server_name              = azurerm_sql_server.sql_server.name
  edition                  = "Basic"
  collation                = "SQL_Latin1_General_CP1_CI_AS"
  create_mode              = "Default"
  max_size_bytes           = 1073741824 # 1 GB
  zone_redundant           = false
}
