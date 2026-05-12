# ============================================================
# VARIABLES TERRAFORM — Environnement DEV
# Ce fichier déclare les variables du projet
# Les valeurs sont dans terraform.tfvars (jamais en dur ici)
# Règle senior : 1 variable = 1 description = 1 type
# ============================================================

# Identifiant de l'abonnement Azure
# Chaque environnement peut avoir sa propre subscription
variable "subscription_id" {
  description = "ID de la subscription Azure cible"
  type        = string
}

# Région Azure de déploiement
# francecentral = données hébergées en France (conformité RGPD)
variable "location" {
  description = "Région Azure de déploiement"
  type        = string
  default     = "francecentral"
}

# Nom de l'environnement
# Valeurs possibles : dev / recette / prod
variable "environnement" {
  description = "Nom de l'environnement cible"
  type        = string
}

# Nom du client
# Utilisé dans les tags et les noms de ressources
variable "client" {
  description = "Nom du client pour les tags de gouvernance"
  type        = string
  default     = "pme-btp"
}

# Nom du projet
# Utilisé dans les tags Cost Management
variable "projet" {
  description = "Nom du projet pour les tags de gouvernance"
  type        = string
  default     = "securisation-tenant"
}