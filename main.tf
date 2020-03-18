
resource "google_secret_manager_secret" "secret" {
  for_each = { for secret in var.secrets : secret.secret_id => secret }

  provider = google-beta

  secret_id = each.value.secret_id

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "secret" {
  for_each = { for secret in var.secrets : secret.secret_id => secret }
  provider = google-beta

  secret = google_secret_manager_secret.secret[each.key].id

  secret_data = each.value.secret_data
}
