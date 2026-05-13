terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "pme_btp" {
  name     = "rg-pme-btp-${var.environnement}"
  location = var.location
  tags = {
    projet        = var.projet
    client        = var.client
    environnement = var.environnement
    gestion       = "terraform"
  }
}