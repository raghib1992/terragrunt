resource "aws_route_table" "eks_public_route" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    "Name" = "${var.environment}-public-route-table"
  }
}

resource "aws_route_table" "eks_private_route" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    "Name" = "${var.environment}-private-route-table"
  }
}

resource "aws_route" "eks_public_igw" {
  route_table_id         = aws_route_table.eks_public_route.id
  gateway_id             = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_route_table.eks_public_route,
    aws_internet_gateway.igw
  ]
}


resource "aws_route" "eks_private_nat" {
  route_table_id         = aws_route_table.eks_public_route.id
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on = [
    aws_route_table.eks_private_route,
    aws_nat_gateway.nat_gw
  ]
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnet)
  subnet_id      = element(aws_subnet.eks_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.eks_public_route.id
}


resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_subnet)
  subnet_id      = element(aws_subnet.eks_private_subnet.*.id, count.index)
  route_table_id = aws_route_table.eks_private_route.id
}