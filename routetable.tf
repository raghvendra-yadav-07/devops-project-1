# this route table is for public subnet
resource "aws_route_table" "route_project_public" {
  vpc_id = aws_vpc.project_1.id
  tags = {
    name = "public_route"
  }

}

resource "aws_route" "public_routing" {
  route_table_id         = aws_route_table.route_project_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internetgateway.id

}

resource "aws_route_table_association" "public_subnet" {
  route_table_id = aws_route_table.route_project_public.id
  subnet_id      = aws_subnet.public_subnet.id

}


# this route table is for privatesubnet
resource "aws_route_table" "route_project_private" {
  vpc_id = aws_vpc.project_1.id
  tags = {
    name = "private_route"
  }
}

resource "aws_route_table_association" "private_subnet" {
  route_table_id = aws_route_table.route_project_private.id
  subnet_id      = aws_subnet.private_subnet.id

}

