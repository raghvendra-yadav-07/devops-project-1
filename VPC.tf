# this is the vpc for my project 
resource "aws_vpc" "project_1" {
  cidr_block = var.vpc_cidr_block
  #tags for my vpc 
  tags = {
    Name = "project-1"


  }

}

