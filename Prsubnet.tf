resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.project_1.id
  cidr_block = var.private_cidr_block

  tags = {
    name = "private_subnet"

  }
}
#security groups for this vpc 
resource "aws_security_group" "SG_project_private" {
  vpc_id = aws_vpc.project_1.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.SG_project_public.id]


  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    name = "SG-private"
  }


}