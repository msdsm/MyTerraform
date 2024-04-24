# Security Group
resource "aws_security_group" "default" {
  name   = local.sg_name
  vpc_id = var.vpc_id

  tags = {
    Name  = "${var.tag_name}-cluster"
    group = "${var.tag_group}"
  }
}

# インバウンドルールに80(http)追加
resource "aws_security_group_rule" "ingress_80" {
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  security_group_id = aws_security_group.default.id
  type              = "ingress"
  cidr_blocks       = [var.sg_ingress_ip_cidr]
}

# アウトバウンドルール全部許可
resource "aws_security_group_rule" "egress_all" {
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  security_group_id = aws_security_group.default.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
