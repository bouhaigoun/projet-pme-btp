# ============================================================
# ENTRA ID — USERS PME BTP
# 3 users représentant les employés de la PME BTP
# Alice = Directrice | Bob = Manager | Claire = Comptable
# ============================================================

resource "azuread_user" "alice" {
  display_name        = "Alice Martin"
  user_principal_name = "alice.martin@bouhaigounnabiloutlook.onmicrosoft.com"
  password            = var.user_password
  force_password_change = true
}

resource "azuread_user" "bob" {
  display_name        = "Bob Dupont"
  user_principal_name = "bob.dupont@bouhaigounnabiloutlook.onmicrosoft.com"
  password            = var.user_password
  force_password_change = true
}

resource "azuread_user" "claire" {
  display_name        = "Claire Durand"
  user_principal_name = "claire.durand@bouhaigounnabiloutlook.onmicrosoft.com"
  password            = var.user_password
  force_password_change = true
}

# ============================================================
# ENTRA ID — GROUPES PME BTP
# Leaders = Directrice | Employees = Manager + Comptable
# ============================================================

resource "azuread_group" "leaders" {
  display_name     = "PME-BTP-Leaders"
  security_enabled = true
  members = [
    azuread_user.alice.id
  ]
}

resource "azuread_group" "employees" {
  display_name     = "PME-BTP-Employees"
  security_enabled = true
  members = [
    azuread_user.bob.id,
    azuread_user.claire.id
  ]
}