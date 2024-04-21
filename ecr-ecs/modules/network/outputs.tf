output "vpc_id" {
  value = aws_vpc.default.id
}
output "public_1_id" {
  value = aws_subnet.public_1.id
}
output "public_2_id" {
  value = aws_subnet.public_2.id
}
