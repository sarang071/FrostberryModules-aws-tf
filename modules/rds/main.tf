resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}
resource "aws_db_subnet_group" "this_db_subnet_group" {
  name       = var.subnet_name
  subnet_ids = var.subnet_ids
}
resource "aws_db_instance" "this_rds" {
  allocated_storage          = 10
  identifier                 = var.identifier
  db_name                    = var.db_name
  engine                     = var.engine
  engine_version             = var.engine_version
  instance_class             = var.instance_class
  username                   = var.username
  password                   = random_password.password.result
  skip_final_snapshot        = true
  db_subnet_group_name       = aws_db_subnet_group.this_db_subnet_group.name
  vpc_security_group_ids     = var.rds_sg_groups
}