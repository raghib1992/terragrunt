locals {
  subnet_az_map = zipmap(var.public_subnet, var.public_az)
}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-north-1"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "environment" {
  description = "The environment for the deployment (e.g., dev, staging, prod)"
  type        = string
  default     = "development"
}

variable "public_subnet" {
  description = "The CIDR block for the public subnet"
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.2.0/24"]
}

variable "private_subnet" {
  description = "The CIDR block for the private subnet"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.3.0/24"]
}

variable "public_az" {
  description = "AZ names for public subnets"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b"]
}

variable "private_az" {
  description = "AZ names for private subnets"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b"]
}
