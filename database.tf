resource "aws_subnet" "db1_subnet" {
  vpc_id            = aws_vpc.project_1.id
  cidr_block        = "10.0.32.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "db1_subnet"

  }
}
#security groups for this vpc 
resource "aws_security_group" "SG_project_database" {
  vpc_id = aws_vpc.project_1.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.SG_project_private.id]


  }
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.SG_project_private.id]


  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    name = "SG-database1"
  }


}

#db2
resource "aws_subnet" "db2_subnet" {
  vpc_id            = aws_vpc.project_1.id
  cidr_block        = "10.0.48.0/20"
  availability_zone = "us-east-1b"


  tags = {
    Name = "db1_subnet"

  }
}
