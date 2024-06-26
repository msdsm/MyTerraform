# Global
variable "region" {}
variable "name_prefix" {}

# Tags
variable "tag_name" {}
variable "tag_group" {}

# ALB
variable "public_1_id" {}
variable "public_2_id" {}
variable "sg_id" {}

# Target Group
variable "vpc_id" {}

locals {
  alb_name = "${var.name_prefix}-alb"
  tg_name  = "${var.name_prefix}-tg"
}
