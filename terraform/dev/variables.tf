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