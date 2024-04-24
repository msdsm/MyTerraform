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
  profile     = var.profile
  tag_name    = var.tag_name
  tag_group   = var.tag_group

  account_id = var.account_id

  dockerfile_path = "./"
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

# Cloud Watch
module "cloudwatch" {
  source = "./modules/cloudwatch"

  name_prefix = var.name_prefix
  region      = var.region
  tag_name    = var.tag_name
  tag_group   = var.tag_group
}

# ALB
module "alb" {
  source = "./modules/alb"

  name_prefix = var.name_prefix
  region      = var.region
  tag_name    = var.tag_name
  tag_group   = var.tag_group

  vpc_id      = module.network.vpc_id
  public_1_id = module.network.public_1_id
  public_2_id = module.network.public_2_id
  sg_id       = module.sg.sg_id
}

# ECS
module "ecs" {
  source = "./modules/ecs"

  name_prefix = var.name_prefix
  region      = var.region
  webapp_port = var.webapp_port
  tag_name    = var.tag_name
  tag_group   = var.tag_group

  # Service
  logs_group_name = module.cloudwatch.logs_group_name
  tg_arn          = module.alb.tg_arn
  public_1_id     = module.network.public_1_id
  public_2_id     = module.network.public_2_id
  sg_id           = module.sg.sg_id
  # Task
  ecr_repository_uri = module.ecr.repository_uri
  execution_role_arn = module.iam.execution_role_arn
}
