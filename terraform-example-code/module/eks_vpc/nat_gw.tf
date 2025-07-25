resource "aws_nat_gateway" "nat_gw" {
  subnet_id     = element(aws_subnet.eks_public_subnet.*.id, 0)
  allocation_id = aws_eip.nat_eip.id

  depends_on = [
    aws_subnet.eks_public_subnet,
    aws_eip.nat_eip
  ]

  tags = {
    "Name" = "${var.environment}-nat-gw"
  }
}