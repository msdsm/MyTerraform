# Global
variable "region" {}
variable "name_prefix" {}
variable "profile" {}

# Tags
variable "tag_name" {}
variable "tag_group" {}


# ECR
variable "account_id" {}

# Dockerfileのパス
variable "dockerfile_path" {}

locals {
  repository_name = "${var.name_prefix}-repository"
  image_name      = "${var.name_prefix}-image"
}
