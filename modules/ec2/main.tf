#==============================================
# EC2 instances
#==============================================
resource "aws_instance" "this_ec2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet
  security_groups = var.sg_ids
  key_name        = var.pub_key_name 
}