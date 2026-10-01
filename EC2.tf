# Public EC2 - Frontend
resource "aws_key_pair" "keypair" {
    key_name = "terraform"
    public_key = file("terraform.pub")
  
}

resource "aws_instance" "frontend" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.SG_project_public.id]

  associate_public_ip_address = true
  key_name                    = aws_key_pair.keypair.id

  tags = {
    Name = "project-frontend"
  }
  user_data = <<-EOF
    #!/bin/bash

    dnf update -y
    dnf install -y nginx

    systemctl enable nginx
    systemctl start nginx
  EOF

  }




# Private EC2 - Backend

resource "aws_instance" "backend" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t2.micro"

  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.SG_project_private.id]

  associate_public_ip_address = false
   key_name                    = aws_key_pair.keypair.id

  tags = {
    Name = "project-backend"
  }
    user_data = <<-EOF
    #!/bin/bash

    dnf update -y
    dnf install -y nginx

    systemctl enable nginx
    systemctl start nginx
  EOF

}
