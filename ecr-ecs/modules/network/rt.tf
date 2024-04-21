# route table作成
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name  = "${var.tag_name}-route-table"
    group = "${var.tag_group}"
  }
}

# route tableのルール作成
# すべてのIPアドレスをターゲットにinternet gatewayを設定
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  gateway_id             = aws_internet_gateway.default.id
  destination_cidr_block = "0.0.0.0/0"
}

# サブネットの関連付け
resource "aws_route_table_association" "public_1" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_1.id
}

# サブネットの関連付け
resource "aws_route_table_association" "public_2" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_2.id
}
