# Projet : Sécurisation Tenant Azure - PME BTP

## Contexte client
PME 60 personnes, secteur BTP, région Centre.
Tentative d'intrusion sur Microsoft 365 — besoin de sécuriser les accès.

## Objectifs
- MFA obligatoire pour tous les users
- Bloquer connexions depuis l'étranger
- Monitorer les connexions suspectes

## Stack technique
- Azure Entra ID
- Conditional Access
- Azure Monitor
- Terraform / Bicep

## Structure
- terraform/ → IaC remise en état
- bicep/ → déploiement ressources
- scripts/ → Azure CLI automation
- docs/ → livrables client
- portal-screenshots/ → preuves de configuration