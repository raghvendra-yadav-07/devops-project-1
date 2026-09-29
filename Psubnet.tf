resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.project_1.id
  cidr_block = var.pulic_cidr_block

  tags = {
    Name = "public_subnet"
  }
}

#internet gateway 
resource "aws_internet_gateway" "internetgateway" {
  vpc_id = aws_vpc.project_1.id

  tags = {
    name = "internet-gateway"
  }
}

#security groups for this vpc 
resource "aws_security_group" "SG_project_public" {
  vpc_id = aws_vpc.project_1.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]


  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    name = "SG-public"
  }
}