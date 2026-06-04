# 🔐 Sécurisation Tenant Azure — PME BTP

> Mission freelance simulée — Sécurisation complète d'un tenant Microsoft 365 / Azure pour une PME BTP de 60 personnes (France, région Centre).

## 🎯 Contexte

Suite à une tentative d'intrusion sur Microsoft 365, la PME BTP mandate un architecte cloud pour sécuriser l'ensemble des accès utilisateurs et déployer une politique Zero Trust.

## ✅ Réalisations

| Composant | Détail | Outil |
|---|---|---|
| Entra ID | 3 users + 2 groupes de sécurité | Terraform |
| RBAC | Contributor / Reader / Billing Reader | Terraform |
| MFA | Obligatoire pour tous les users | Conditional Access |
| Geo-blocking | Blocage de toute connexion hors France | Conditional Access |
| IaC | 100% Infrastructure as Code | Terraform |

## 🏗️ Architecture

projet-pme-btp/
├── terraform/dev/
│   ├── main.tf                 # Provider Azure + AzureAD
│   ├── entra-id.tf             # Users + Groupes
│   ├── rbac.tf                 # Assignments RBAC
│   ├── outputs.tf              # Outputs post-deploy
│   └── conditional-access.tf  # Policies MFA + Geo-block
├── docs/                       # Livrables client
└── portal-screenshots/         # Preuves de configuration

## 🔧 Stack technique

- **Azure Entra ID** — Identité et accès
- **Conditional Access** — MFA + blocage géographique
- **Terraform** — Infrastructure as Code
- **Azure CLI** — Automation et audit
- **Git / GitHub** — Versioning

## 🚀 Déploiement

```bash
cd terraform/dev
terraform init
terraform plan -out=tfplan
terraform apply tfplan
```

## 📋 Prérequis

- Licence Microsoft Entra ID P1 (ou Entra Suite Trial)
- Azure CLI authentifié (`az login`)
- Terraform >= 1.3

## 👤 Auteur

**Nabil Bouhaigoun** — Architecte Cloud Azure Freelance  
[LinkedIn](https://linkedin.com/in/bouhaigoun) | [Malt](https://www.malt.fr)