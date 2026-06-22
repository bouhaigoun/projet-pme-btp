terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.50"
    }
  }
}

# ============================================================
# PROVIDER AZURERM — Auth via SP sp-terraform-pme-btp
# Credentials lus depuis variables d'environnement ARM_*
# Jamais de credentials dans le code — pratique senior
# ARM_CLIENT_ID / ARM_CLIENT_SECRET / ARM_SUBSCRIPTION_ID / ARM_TENANT_ID
# ============================================================
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  use_cli         = false
}

# ============================================================
# PROVIDER AZUREAD — Auth via même SP pour Entra ID
# Gère : users, groups, CA policies, app registrations
# ============================================================
provider "azuread" {
  tenant_id = var.tenant_id
  use_cli   = false
}

# ============================================================
# RESOURCE GROUP — PME BTP
# Tags : valeurs issues du tenant réel, aucune valeur inventée
# owner = email consultant réel depuis var.consultant_email
# ============================================================
resource "azurerm_resource_group" "pme_btp" {
  name     = "rg-pme-btp-${var.environnement}"
  location = var.location
  tags = {
    projet        = var.projet
    client        = var.client
    environnement = var.environnement
    gestion       = "terraform"
    owner         = var.consultant_email
    cost_center   = var.cost_center
  }
}
