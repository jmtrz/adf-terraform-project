# Core deployment identifiers
resource "random_id" "suffix" {
  byte_length = 4
  keepers = {
    company_name = var.company_name
    environment  = var.environment
  }
}