#outputs storage account ID
output "storage_account_id" {
    value = azurerm_storage_account.dbricks.id
}