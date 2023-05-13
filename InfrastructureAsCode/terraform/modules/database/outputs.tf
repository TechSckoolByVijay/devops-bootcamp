# Output the connection string for the database
output "connection_string" {
  value = "Server=${azurerm_sql_server.sql_server.fqdn};Database=${azurerm_sql_database.db.name};User ID=${azurerm_sql_server.sql_server.administrator_login}@${azurerm_sql_server.sql_server.name};Password=${azurerm_sql_server.sql_server.administrator_login_password};Encrypt=true;Connection Timeout=30;"
}
