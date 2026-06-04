# 🎯 Session 4 — Coaching Azure Freelance
*Projet : Sécurisation Tenant PME BTP — Suite Session 3*
*À reprendre au prochain démarrage*

---

## ✅ Livré en Session 3

| Livrable | Statut | Détail |
|---|---|---|
| 3 users Entra ID | ✅ | Alice Martin, Bob Dupont, Claire Durand |
| 2 groupes sécurité | ✅ | PME-BTP-Leaders (Alice) + PME-BTP-Employees (Bob+Claire) |
| Provider azuread | ✅ | main.tf mis à jour (~> 2.0) |
| entra-id.tf | ✅ | Users + groupes en IaC Terraform |
| variables.tf | ✅ | Variable user_password (sensitive) ajoutée |
| terraform.tfvars | ✅ | user_password défini (git-ignored) |
| Import Terraform | ✅ | 5 ressources importées dans tfstate |
| Commit Git | ✅ | feat: entra-id users and groups via Terraform |

---

## 🔧 Environnement de travail

```
Répertoire projet : C:\Users\nabil\Projet-azure\projet-pme-btp
Subscription      : 5fd59e3f-efbc-4dfa-8058-c04fb9320c2d
Tenant ID         : b511c4af-0f03-4b77-9250-c748c4798ca4
Domaine tenant    : bouhaigounnabiloutlook.onmicrosoft.com
Compte Azure      : bouhaigoun.nabil@outlook.com
Région            : francecentral
```

### IDs des ressources créées

```
Alice Martin  : 1ff1bd00-50da-4803-b8ce-85e778360a93
Bob Dupont    : d1bc817a-8932-46ee-8fa7-cb9592eb06bc
Claire Durand : f596b768-d76d-432b-9cb3-ac91b789187e
PME-BTP-Leaders   : 5861e000-3676-415b-9ed9-036810c2ea67
PME-BTP-Employees : ee3adf6e-8338-4ee1-b4bd-15bb6ebcba7d
```

### Commandes de démarrage session

```powershell
# 1. Connexion Azure
az login --use-device-code

# 2. Vérifier le compte
az account show

# 3. Aller dans le projet
cd C:\Users\nabil\Projet-azure\projet-pme-btp

# 4. Vérifier l'état Git
git log --oneline
git status

# 5. Vérifier les users existent toujours
az ad user list --query "[?displayName=='Alice Martin' || displayName=='Bob Dupont' || displayName=='Claire Durand'].{Nom:displayName}" -o table
```

---

## 🎯 Objectifs Session 4

### Étape 1 — Assigner les rôles Azure RBAC
Donner les bonnes permissions à chaque user selon son profil :
- Alice : `Contributor` sur la subscription (admin)
- Bob : `Reader` sur le resource group (consultation)
- Claire : `Billing Reader` sur la subscription (comptabilité)

### Étape 2 — Activer MFA via Conditional Access
- Créer policy CA : "Require MFA for all users"
- Tester login avec Microsoft Authenticator
- Vérifier dans Entra ID > Security > Authentication methods

### Étape 3 — Conditional Access Géolocalisation
- Créer named location "France"
- Policy : bloquer toutes connexions hors France
- Tester : login depuis France (✅) vs VPN étranger (❌)

### Étape 4 — Conditional Access Device Compliance
- Policy : MFA obligatoire si device non-conforme
- Policy : blocage si risk level = High
- Tester les deux scénarios

### Étape 5 — outputs.tf
- Exposer les IDs des ressources créées
- Output : resource group ID, users IDs, groupes IDs

### Étape 6 — Commit + Documentation
- Git commit propre
- Mise à jour README.md
- Screenshots Portal Azure

---

## 📁 Structure projet actuelle

```
projet-pme-btp/
├── .gitignore              ✅
├── README.md               ✅
├── terraform/
│   └── dev/
│       ├── main.tf         ✅ provider azurerm + azuread
│       ├── variables.tf    ✅ 6 variables dont user_password
│       ├── terraform.tfvars ✅ (git-ignored)
│       ├── entra-id.tf     ✅ users + groupes
│       └── terraform.tfstate ✅ 5 ressources importées
├── docs/
│   └── entra-id-users.md   ✅ (à compléter)
├── scripts/                🔲 à remplir session 4
└── portal-screenshots/     🔲 à remplir session 4
```

---

## 📝 Notes importantes

- `terraform.tfvars` ne va JAMAIS sur GitHub
- Toujours `terraform plan` avant `terraform apply`
- Convention commits : `feat:` / `fix:` / `docs:` / `chore:`
- Domaine tenant : `bouhaigounnabiloutlook.onmicrosoft.com`
- Pour les policies CA : nécessite licence Entra ID P1 (vérifier disponibilité)
- Les IDs des ressources sont dans ce fichier — ne pas re-chercher

---

## 💰 Crédit Azure

Surveiller : portal.azure.com → Cost Management + Billing
- Session 3 consommé : ~$0 (users/groupes Entra ID = gratuit)
- Session 4 estimé : ~$2-5 (RBAC + CA = gratuit, MFA = gratuit P1)
