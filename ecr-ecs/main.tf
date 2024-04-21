provider "aws" {
  region  = var.region
  profile = var.profile
  default_tags {
    tags = {
      hashicorp-learn = "learn-terraform-functions"
    }
  }
}

# ECR
module "ecr" {
  source = "./modules/ecr"

  name_prefix = var.name_prefix
  region      = var.region
  tag_name    = var.tag_name
  tag_group   = var.tag_group

  account_id = var.account_id
}

# IAM
module "iam" {
  source = "./modules/iam"

  name_prefix = var.name_prefix
  region      = var.region
  tag_name    = var.tag_name
  tag_group   = var.tag_group
}

# Network
module "network" {
  source = "./modules/network"

  name_prefix = var.name_prefix
  region      = var.region
  tag_name    = var.tag_name
  tag_group   = var.tag_group
}

# Security Group
module "sg" {
  source = "./modules/sg"

  name_prefix = var.name_prefix
  region      = var.region
  tag_name    = var.tag_name
  tag_group   = var.tag_group

  vpc_id             = module.network.vpc_id
  sg_ingress_ip_cidr = var.sg_ingress_ip_cidr
}
