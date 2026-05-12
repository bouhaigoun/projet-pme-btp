# ============================================================
# TERRAFORM CONFIGURATION
# Déclare le provider Azure et sa version
# ~> 3.0 = accepte toutes les versions 3.x — stabilité garantie
# ============================================================
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# ============================================================
# PROVIDER AZURE
# Terraform utilise les credentials az login
# subscription_id vient de terraform.tfvars — jamais en dur
# ============================================================
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# ============================================================
# RESOURCE GROUP — Conteneur du projet PME BTP
# Nom dynamique : rg-pme-btp-dev / rg-pme-btp-recette / rg-pme-btp-prod
# L'environnement est injecté via la variable var.environnement
# En mission : 1 resource group par environnement = isolation totale
# ============================================================
resource "azurerm_resource_group" "pme_btp" {
  name     = "rg-pme-btp-${var.environnement}"
  location = var.location

  tags = {
    # Tags de gouvernance — obligatoires pour Cost Management
    projet        = var.projet
    client        = var.client
    environnement = var.environnement
    gestion       = "terraform"
  }
}