terraform {
    source = "git::git@github.com:raghib1992/terraform-tuts.git//terrgrunt/example?ref=v1.0.3"
}

include "root" {
    path = find_in_parent_folders()
}

inputs = {
    environment = "Staging"
    aws_region = "eu-central-1"
    azs = ["eu-central-1a", "eu-central-1b"]
    private_subnet = ["10.10.20.0/24", "10.10.32.0/24"]
}