# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
    backend "s3" {
        bucket = "terragrunt-backend-statefile"
        region  = "eu-north-1"
        key     = "./terraform.tfstate"
        encrypt = true
    }
}
