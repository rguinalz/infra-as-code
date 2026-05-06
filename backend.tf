# state.tf
terraform {
  backend "s3" {
    bucket  = "terraform-state-rguinalz"
    key     = "site/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
    user_lockfile = true

  }
}