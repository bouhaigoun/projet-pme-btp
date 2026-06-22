variable "subscription_id" {
  description = "ID de la subscription Azure cible"
  type        = string
}

variable "location" {
  description = "Région Azure de déploiement"
  type        = string
  default     = "francecentral"
}

variable "environnement" {
  description = "Nom de l'environnement cible"
  type        = string
}

variable "client" {
  description = "Nom du client pour les tags de gouvernance"
  type        = string
  default     = "pme-btp"
}

variable "projet" {
  description = "Nom du projet pour les tags de gouvernance"
  type        = string
  default     = "securisation-tenant"
}

variable "user_password" {
  description = "Mot de passe temporaire des users Entra ID PME BTP"
  type        = string
  sensitive   = true
}
# ============================================================
# RBAC — Object IDs des users Entra ID
# Récupérés via : az ad user list
# Utilisés pour assigner les rôles RBAC aux bons utilisateurs
# Ne jamais hardcoder ces IDs dans rbac.tf — toujours via variables
# ============================================================

variable "alice_object_id" {
  description = "Object ID Entra ID de Alice Martin — Contributor"
  type        = string
}

variable "bob_object_id" {
  description = "Object ID Entra ID de Bob Dupont — Reader"
  type        = string
}

variable "claire_object_id" {
  description = "Object ID Entra ID de Claire Durand — Billing Reader"
  type        = string
}
variable "tenant_id" {
  description = "ID du tenant Entra ID PME-BTP"
  type        = string
}

variable "break_glass_object_id" {
  description = "Object ID du compte Break Glass — exclu de toutes les CA policies"
  type        = string
}

variable "consultant_email" {
  description = "Email du consultant Nabil — tag owner sur les ressources"
  type        = string
}

variable "cost_center" {
  description = "Centre de coût de la mission PME-BTP"
  type        = string
}
