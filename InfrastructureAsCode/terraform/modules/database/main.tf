# Create an Azure SQL Server
resource "azurerm_sql_server" "myorgdbserver" {
  name                         = "example-sql-server"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234"
}

# Create a firewall rule to allow traffic from all Azure services
resource "azurerm_sql_firewall_rule" "example" {
  name                = "AllowAllWindowsAzureIps"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

# Create an Azure SQL Database
resource "azurerm_sql_database" "example" {
  name                = "example-db"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  edition             = "Basic"
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_bytes      = 2147483648
}

