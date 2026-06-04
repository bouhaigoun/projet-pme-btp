# ============================================================
# OUTPUTS — Projet PME BTP
# Expose les valeurs clés après terraform apply
# Utile pour : audit, connexion d'autres modules, documentation
# En mission : toujours outputer les IDs critiques
# ============================================================

# ============================================================
# RESOURCE GROUP
# ============================================================

# ID du resource group dev
output "resource_group_id" {
  description = "ID du resource group pme-btp-dev"
  value       = azurerm_resource_group.pme_btp.id
}

# ============================================================
# USERS ENTRA ID
# ============================================================

# ID Alice Martin
output "alice_object_id" {
  description = "Object ID Entra ID de Alice Martin"
  value       = azuread_user.alice.id
}

# ID Bob Dupont
output "bob_object_id" {
  description = "Object ID Entra ID de Bob Dupont"
  value       = azuread_user.bob.id
}

# ID Claire Durand
output "claire_object_id" {
  description = "Object ID Entra ID de Claire Durand"
  value       = azuread_user.claire.id
}

# ============================================================
# GROUPES ENTRA ID
# ============================================================

# ID groupe Leaders
output "group_leaders_id" {
  description = "ID du groupe PME-BTP-Leaders"
  value       = azuread_group.leaders.id
}

# ID groupe Employees
output "group_employees_id" {
  description = "ID du groupe PME-BTP-Employees"
  value       = azuread_group.employees.id
}

# ============================================================
# RBAC ASSIGNMENTS
# ============================================================

# ID assignment Alice Contributor
output "rbac_alice_contributor_id" {
  description = "ID du role assignment Alice Contributor"
  value       = azurerm_role_assignment.alice_contributor.id
}

# ID assignment Bob Reader
output "rbac_bob_reader_id" {
  description = "ID du role assignment Bob Reader"
  value       = azurerm_role_assignment.bob_reader.id
}

# ID assignment Claire Billing Reader
output "rbac_claire_billing_id" {
  description = "ID du role assignment Claire Billing Reader"
  value       = azurerm_role_assignment.claire_billing.id
}