# ============================================================
# CONDITIONAL ACCESS — Projet PME BTP
# 2 policies de sécurité obligatoires pour toute PME post-2024
# CA-01 : MFA obligatoire pour tous les users
# CA-02 : Blocage accès hors France
# En mission : toujours en mode "Enabled" jamais "Report Only"
# après validation avec le client
# ============================================================

# ============================================================
# CA-01 — MFA obligatoire tous users PME BTP
# Contexte : vague cyberattaques PME BTP 2023-2024
# Sans MFA = 80% des compromissions de compte évitables
# Exclusion Break Glass : compte d'urgence DSI — jamais soumis au MFA
# Piège terrain : Break Glass doit être exclu AVANT activation CA
# ============================================================
resource "azuread_conditional_access_policy" "require_mfa" {
  display_name = "CA-01-PME-BTP-Require-MFA"
  state        = "enabled"
  conditions {
    users {
      included_users = ["All"]
      # Break Glass exclu — accès d'urgence non bloqué
      # Règle senior : TOUJOURS exclure Break Glass de toutes les CA policies
      excluded_users = [var.break_glass_object_id]
    }
    applications {
      included_applications = ["All"]
    }
    platforms {
      included_platforms = ["all"]
    }
    locations {
      included_locations = ["All"]
    }
    client_app_types = ["all"]
  }
  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa"]
  }
}

# ============================================================
# NAMED LOCATION — France
# Définit la France comme zone de confiance
# Utilisé par CA-02 pour bloquer tout accès hors France
# ============================================================
resource "azuread_named_location" "france" {
  display_name = "France"
  country {
    countries_and_regions                 = ["FR"]
    include_unknown_countries_and_regions = false
  }
}

# ============================================================
# CA-02 — Bloquer accès hors France
# Contexte : PME BTP française, aucun besoin d'accès international
# Réduit drastiquement la surface d'attaque
# Exclusion Break Glass : le DSI peut intervenir depuis n'importe où
# en cas d'urgence (ex : cyberattaque depuis l'étranger)
# ============================================================
resource "azuread_conditional_access_policy" "block_outside_france" {
  display_name = "CA-02-PME-BTP-Block-Outside-France"
  state        = "enabled"
  conditions {
    users {
      included_users = ["All"]
      # Break Glass exclu — DSI doit pouvoir accéder depuis n'importe où
      excluded_users = [var.break_glass_object_id]
    }
    applications {
      included_applications = ["All"]
    }
    platforms {
      included_platforms = ["all"]
    }
    locations {
      included_locations = ["All"]
      excluded_locations = [azuread_named_location.france.id]
    }
    client_app_types = ["all"]
  }
  grant_controls {
    operator          = "OR"
    built_in_controls = ["block"]
  }
}
