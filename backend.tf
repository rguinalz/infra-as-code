# state.tf
terraform {
  backend "s3" {
    bucket  = "terraform-state-rguinalz"
    key     = "site2/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
    user_lockfile = true

  }
}