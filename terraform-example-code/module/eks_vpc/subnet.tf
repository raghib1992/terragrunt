resource "aws_subnet" "eks_public_subnet" {
  for_each                = toset(var.public_subnet)
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = each.value
  availability_zone       = local.subnet_az_map[each.value]
  map_public_ip_on_launch = true

  tags = {
    "Name" = "${var.environment}-public-subnet-${each.key}"
  }
}


resource "aws_subnet" "eks_private_subnet" {
  count                   = length(var.private_subnet)
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = element(var.private_subnet, count.index)
  map_public_ip_on_launch = false
  availability_zone       = element(var.private_az, count.index)

  tags = {
    "Name" = "${var.environment}-private-subnet-${element(var.private_az, count.index)}"
  }

}