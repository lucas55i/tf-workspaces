resource "aws_internet_gateway" "elastic_gw" {
  vpc_id = aws_vpc.elastic_vpc.id
  tags = merge(
    var.tags,
    {
    Name = "${var.project_name}-igw" }
  )
}

resource "aws_route_table" "elastic_public_route_table" {
  vpc_id = aws_vpc.elastic_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.elastic_gw.id
  }
  tags = merge(
    var.tags,
    {
    Name = "${var.project_name}-pub-route-table" }
  )
}