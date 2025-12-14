resource "aws_subnet" "elastic_subnet_private_1a" {
  vpc_id            = aws_vpc.elastic_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"
  tags = merge(
    var.tags,
    {
      Name                              = "${var.project_name}-priv-subnet-1a"
    }
  )
}

resource "aws_subnet" "elastic_subnet_private_1b" {
  vpc_id            = aws_vpc.elastic_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"
  tags = merge(
    var.tags,
    {
      Name                              = "${var.project_name}-priv-subnet-1b"
    }
  )
}

resource "aws_route_table_association" "elastic_rtb_assoc_priv_1a" {
  subnet_id      = aws_subnet.elastic_subnet_private_1a.id
  route_table_id = aws_route_table.elastic_private_route_table_1a.id
}

resource "aws_route_table_association" "elastic_rtb_assoc_priv_1b" {
  subnet_id      = aws_subnet.elastic_subnet_private_1b.id
  route_table_id = aws_route_table.elastic_private_route_table_1b.id
}