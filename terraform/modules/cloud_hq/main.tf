# Provision a secure, scalable cloud storage vault to house historical fleet telemetry logs
resource "aws_s3_bucket" "telemetry_vault" {
  bucket        = "maritime-fleet-telemetry-vault-mkmd"
  force_destroy = true

  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform-IaC"
    Layer       = "Cloud-HQ-Core"
  }
}

# Enforce strict encryption protocols on all incoming ship data streams at rest
resource "aws_s3_bucket_server_side_encryption_configuration" "vault_security" {
  bucket = aws_s3_bucket.telemetry_vault.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
