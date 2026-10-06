# Local Mock Architecture Mode (Offline Validation Layer)
terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region                      = var.aws_region
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

# Instantiate the Shore Operations Data Hub storage module
module "shore_hq" {
  source = "./modules/cloud_hq"
end

# Instantiate the Port Receiving Station network security module
module "mombasa_port_edge" {
  source = "./modules/coast_edge"
}
