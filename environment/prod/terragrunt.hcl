terraform {
    source = "git::git@github.com:raghib1992/terraform-tuts.git//terrgrunt/example?ref=v1.0.3"
}

include "root" {
    path = find_in_parent_folders()
}

inputs = {
    environment = "Production"
    aws_region = "eu-west-1"
    azs = ["eu-west-1a", "eu-west-1b"]
    private_subnet = ["10.10.20.0/24", "10.10.32.0/24"]
}