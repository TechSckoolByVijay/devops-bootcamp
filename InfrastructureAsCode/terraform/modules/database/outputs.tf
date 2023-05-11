# Output the connection string for the database
output "connection_string" {
  value = "Server=${azurerm_sql_server.example.fqdn};Database=${azurerm_sql_database.example.name};User ID=${azurerm_sql_server.example.administrator_login}@${azurerm_sql_server.example.name};Password=${azurerm_sql_server.example.administrator_login_password};Encrypt=true;Connection Timeout=30;"
}
