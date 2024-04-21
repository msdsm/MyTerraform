# availability zone取得
data "aws_availability_zones" "available" {
  state = "available"
}

# サブネット作成
resource "aws_subnet" "public_1" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.default.id
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name  = "${var.tag_name}-subnet-a"
    group = "${var.tag_group}"
  }
}

resource "aws_subnet" "public_2" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.default.id
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name  = "${var.tag_name}-subnet-a"
    group = "${var.tag_group}"
  }
}
