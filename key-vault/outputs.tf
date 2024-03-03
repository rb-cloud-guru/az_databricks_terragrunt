#outputs keyvault id
output "keyvault_id" {
    value = azurerm_key_vault.kv.id
}

#outputs keyvault uri
output "keyvault_uri" {
    value = azurerm_key_vault.kv.vault_uri
}