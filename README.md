# 🔐 Sécurisation Tenant Azure — PME BTP

> **Projet freelance simulé** — Mission type : sécurisation d'un tenant Microsoft 365 / Azure pour une PME BTP de 60 personnes (Centre-Val de Loire) suite à une tentative d'intrusion.

---

## 🎯 Contexte client

| | |
|---|---|
| **Secteur** | BTP — 60 collaborateurs |
| **Région** | Centre-Val de Loire, France |
| **Problème** | Tentative d'intrusion sur Microsoft 365 — accès non sécurisés |
| **Besoin** | MFA obligatoire, blocage hors France, gouvernance des accès |
| **TJM mission** | 650–900 € / jour |

---

## ✅ Livrables réalisés

| Livrable | Technologie | Statut |
|---|---|---|
| Utilisateurs Entra ID (Alice, Bob, Claire) | Terraform | ✅ |
| Groupes de sécurité (Leaders, Employees) | Terraform | ✅ |
| RBAC Contributor / Reader / Billing Reader | Terraform | ✅ |
| Conditional Access — MFA obligatoire | Terraform | ✅ |
| Conditional Access — Blocage hors France | Terraform | ✅ |
| Named Location "France" | Terraform | ✅ |
| Infrastructure as Code versionnée | Git + GitHub | ✅ |

---

## 🏗️ Stack technique

```
Terraform · Azure CLI · Entra ID · Git · GitHub · VSCode
```

---

## 📁 Structure du projet

![Arborescence fichiers Terraform](portal-screenshots/Arborescence%20fichiers.tf.png)

---

## 👥 Gouvernance des identités

### Groupes de sécurité

**PME-BTP-Leaders** (Direction + Management)

![Membres groupe Leaders](portal-screenshots/Membre%20groupe%20Leadres.png)

**PME-BTP-Employees** (Collaborateurs)

![Membres groupe Employees](portal-screenshots/membres_groupe_emplyées.png)

---

## 🔑 RBAC — Contrôle d'accès par rôle

| Utilisateur | Rôle | Périmètre |
|---|---|---|
| Alice Martin | Contributeur | Subscription |
| Bob Dupont | Lecteur | Resource Group |
| Claire Durand | Lecteur de facturation | Subscription |

![RBAC Assignments](portal-screenshots/RBAC-%20Contributor%20-Reader%20-Billing%20Reader.png)

---

## 🛡️ Conditional Access

Deux politiques actives — zéro Security Defaults, gouvernance complète par Conditional Access.

![Conditional Access Policies](portal-screenshots/Conditional%20Access.png)

### Named Location — France

Seules les connexions depuis la France sont autorisées.

![Named Location France](portal-screenshots/Named%20Locations.png)

---

## 🗂️ Infrastructure as Code

Toute l'infrastructure est définie en Terraform, versionnée sur GitHub, reproductible en 2 minutes.

```
terraform/dev/
├── main.tf                  # Provider AzureRM + AzureAD
├── variables.tf             # Variables externalisées
├── entra-id.tf              # Users + Groupes
├── rbac.tf                  # Assignments RBAC
├── conditional-access.tf    # Policies CA + Named Location
└── outputs.tf               # 9 outputs exposés
```

---

## 💡 Valeur livrée au client

| Action technique | Valeur métier |
|---|---|
| Users nominatifs + groupes | Conformité RGPD — chaque accès tracé |
| MFA obligatoire | Blocage 99% des attaques par credential stuffing |
| Blocage hors France | Réduction surface d'attaque géographique |
| Code Terraform versionné | Disaster recovery en 2 minutes |
| Git history propre | Audit trail — qui a changé quoi et quand |

---

## 👤 Auteur

**Nabil Bouhaigoun** — Consultant Azure Freelance  
📍 Orléans, France  
🔗 [Malt](#) · [LinkedIn](#) · [GitHub](https://github.com/bouhaigoun/projet-pme-btp)
