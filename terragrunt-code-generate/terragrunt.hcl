terraform {
  source = "../terraform-example-code/module/ec2/"
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {
    bucket         = "raghib-lambda-statefile"
    key            = "terragrunt/state/ec2/terraform.tfstate"
    region         = "eu-north-1"
    use_lockfile = true
  }
}
EOF
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "eu-north-1"
}
EOF
}