
variable "secrets" {
  type = list(object({
    secret_id    = string,
    secret_data = string,
  }))
}
