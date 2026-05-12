# Projet : Sécurisation Tenant Azure - PME BTP

## Contexte client
PME 60 personnes, secteur BTP, région Centre.
Tentative d'intrusion sur Microsoft 365 — besoin de sécuriser les accès.

## Objectifs
- MFA obligatoire pour tous les users
- Bloquer connexions depuis l'étranger
- Monitorer les connexions suspectes
- Livraison CI/CD via Azure DevOps (dev → prod)

## Environnements
| Environnement | Objectif |
|---|---|
| dev | Développement et tests techniques |
| recette | Validation fonctionnelle par le client |
| prod | Environnement client final |

## Pipeline CI/CD
- Outil : Azure DevOps
- Trigger : push sur branche main
- Etapes : terraform plan → validation manuelle → terraform apply
- Promotion : dev validé → merge → déploiement prod automatique

## Stack technique
- Azure Entra ID
- Conditional Access
- Azure Monitor
- Terraform / Bicep
- Azure DevOps (CI/CD)

## Structure
- terraform/        → IaC par environnement
- bicep/            → déploiement ressources complémentaires
- scripts/          → Azure CLI automation
- docs/             → livrables client
- portal-screenshots/ → preuves de configuration
- .devops/          → pipelines YAML Azure DevOps