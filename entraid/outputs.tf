#outputs 
output "app_pwd" {
    value = azuread_application_password.dbricks_app_sec.value
    sensitive = true
}

output "client_id" {
    value = azuread_service_principal.spn.id
    sensitive = true
}

output "tenant_id" {
    value = data.azuread_client_config.current.tenant_id
    sensitive = true 
}