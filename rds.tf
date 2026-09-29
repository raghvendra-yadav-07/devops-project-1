# 2. RDS DB Subnet Group
# Existing 2 private DB subnets use karna

resource "aws_db_subnet_group" "project_db_subnet" {
  name        = "project-db-subnet"
  description = "Private subnets for RDS"

  subnet_ids = [
    aws_subnet.db1_subnet.id,
    aws_subnet.db2_subnet.id
  ]

  tags = {
    Name = "project-db-subnet"
  }
}


# 3. RDS MySQL Instance

resource "aws_db_instance" "project_rds" {
  identifier = "project-rds-db"

  engine         = "mysql"
  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"
  storage_encrypted = true

  db_name  = "projectdb"
  username = "dbadmin"

  # REMOVED: manage_master_user_password = false
  # Simply passing the password tells Terraform to handle it manually
  password = var.db_password 

  # Network settings
  db_subnet_group_name = aws_db_subnet_group.project_db_subnet.name

  vpc_security_group_ids = [
    aws_security_group.SG_project_database.id
  ]

  publicly_accessible = false
  multi_az            = false

  # Backup
  backup_retention_period = 1

  # Learning environment only
  deletion_protection = false
  skip_final_snapshot = true

  tags = {
    Name = "project-rds"
  }
}
