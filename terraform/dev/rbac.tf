# ============================================================
# RBAC ASSIGNMENTS — Projet PME BTP
# Principe du moindre privilège : chaque user a uniquement
# les droits nécessaires à son rôle métier
# En mission : toujours versionner le RBAC via IaC, jamais
# via le portail — traçabilité + reproductibilité
# ============================================================

# ============================================================
# DATA SOURCES — Récupère les IDs Azure existants
# On ne recrée pas ce qui existe, on le référence
# ============================================================

# Récupère l'ID de la subscription active
data "azurerm_subscription" "current" {}

# Récupère le resource group existant créé en session 2
data "azurerm_resource_group" "dev" {
  name = "rg-pme-btp-dev"
}

# ============================================================
# ALICE MARTIN — Contributor sur la subscription
# Peut créer/modifier/supprimer des ressources
# Profil : cheffe de projet technique
# ============================================================
resource "azurerm_role_assignment" "alice_contributor" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = var.alice_object_id
}

# ============================================================
# BOB DUPONT — Reader sur le resource group dev
# Lecture seule, ne peut rien modifier
# Profil : support / audit interne
# ============================================================
resource "azurerm_role_assignment" "bob_reader" {
  scope                = data.azurerm_resource_group.dev.id
  role_definition_name = "Reader"
  principal_id         = var.bob_object_id
}

# ============================================================
# CLAIRE DURAND — Billing Reader sur la subscription
# Accès facturation uniquement
# Profil : DAF / responsable comptabilité
# ============================================================
resource "azurerm_role_assignment" "claire_billing" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Billing Reader"
  principal_id         = var.claire_object_id
}