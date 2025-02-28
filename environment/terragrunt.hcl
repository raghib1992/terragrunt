generate "backend" {
    path      = "s3-backend.tf"
    if_exists = "overwrite_terragrunt"
    contents  = <<EOF
terraform {
    backend "s3" {
        bucket = "terragrunt-backend-statefile"
        region  = "eu-north-1"
        key     = "${path_relative_to_include()}/terraform.tfstate"
        encrypt = true
    }
}
EOF
}