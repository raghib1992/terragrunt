terraform {
    source = "git::git@github.com:raghib1992/terraform-tuts.git//terrgrunt/example?ref=v1.1.1"
}

include "root" {
    path = find_in_parent_folders()
}


locals {
    region = "eu-north-1"
    env    = "Production"
}

inputs = {
    environment       = local.env
    eks_cluster_name  = "eks-${local.env}-cluster"
    cluster_role      = "eks-${local.env}-cluster-role"
    node_group_name   = "eks-${local.env}-node-group"
    nodegroup_keypair = "eks-${local.env}-key"
    node_role_name    = "eks-${local.env}-node-role"
    region_name       = local.region
    vpc_cidr_block    = "10.32.0.0/16"
    azs               = ["${local.region}a", "${local.region}b"]
    public_subnets    = ["10.32.0.0/24", "10.32.8.0/24"]
    private_subnets   = ["10.32.16.0/24", "10.32.24.0/24"]
}