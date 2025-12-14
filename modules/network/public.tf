resource "aws_subnet" "elastic_subnet_puclic_1a" {
  vpc_id                  = aws_vpc.elastic_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name}-pub-subnet-1a",
    }
  )
}

resource "aws_subnet" "elastic_subnet_puclic_1b" {
  vpc_id                  = aws_vpc.elastic_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true
  tags = merge(
    var.tags,
    {
      Name                     = "${var.project_name}-pub-subnet-1b",
    }
  )
}

resource "aws_route_table_association" "elastic_rtb_assoc_1a" {
  subnet_id      = aws_subnet.elastic_subnet_puclic_1a.id
  route_table_id = aws_route_table.elastic_public_route_table.id
}

resource "aws_route_table_association" "elastic_rtb_assoc_1b" {
  subnet_id      = aws_subnet.elastic_subnet_puclic_1b.id
  route_table_id = aws_route_table.elastic_public_route_table.id
}